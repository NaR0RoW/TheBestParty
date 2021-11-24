import UIKit

final class ImageDownloader {
    static let shared = ImageDownloader()
    
    private var cachedImages: [String: UIImage]
    private var imagesDownloadTasks: [String: URLSessionDataTask]
    
    private init() {
        cachedImages = [:]
        imagesDownloadTasks = [:]
    }
    
    let serialQueueForImages = DispatchQueue(label: "images.queue", attributes: .concurrent)
    let serialQueueForDataTasks = DispatchQueue(label: "dataTasks.queue", attributes: .concurrent)
    
    func downloadImage(with imageUrlString: String?, completionHandler: @escaping (UIImage?, Bool) -> Void, placeholderImage: UIImage?) {
        guard let imageUrlString = imageUrlString else {
            completionHandler(placeholderImage, true)
            return
        }
        
        if let image = getCachedImageFrom(urlString: imageUrlString) {
            completionHandler(image, true)
        } else {
            guard let url = URL(string: imageUrlString) else {
                completionHandler(placeholderImage, true)
                return
            }
            
            if let _ = getDataTaskFrom(urlString: imageUrlString) {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    return
                }
                
                if let _ = error {
                    DispatchQueue.main.async {
                        completionHandler(placeholderImage, true)
                    }
                    return
                }
                
                let image = UIImage(data: data)
                
                self.serialQueueForImages.sync(flags: .barrier) {
                    self.cachedImages[imageUrlString] = image
                }
             
                _ = self.serialQueueForDataTasks.sync(flags: .barrier) {
                    self.imagesDownloadTasks.removeValue(forKey: imageUrlString)
                }
                
                DispatchQueue.main.async {
                    completionHandler(image, false)
                }
            }
            
            self.serialQueueForDataTasks.sync(flags: .barrier) {
                imagesDownloadTasks[imageUrlString] = task
            }
            
            task.resume()
        }
    }
    
    private func getCachedImageFrom(urlString: String) -> UIImage? {
        serialQueueForImages.sync {
            return cachedImages[urlString]
        }
    }
    
    private func getDataTaskFrom(urlString: String) -> URLSessionTask? {
        serialQueueForImages.sync {
            return imagesDownloadTasks[urlString]
        }
    }
}
