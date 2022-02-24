import UIKit.UIImageView

 private let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImageUsingCacheWithURLString(with URLString: String, placeHolder: UIImage?) {
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            self.image = cachedImage
            
            return
        }
        
        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if error != nil {
                    print("Error loading images from url: \(String(describing: error))")
                    DispatchQueue.main.async { [weak self] in
                        self?.image = placeHolder
                    }
                    
                    return
                }
                
                DispatchQueue.main.async { [weak self] in
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            self?.image = downloadedImage
                        }
                    }
                }
            }
            .resume()
        }
    }
}
