import UIKit.UIImageView

private let imageCache = NSCache<AnyObject, AnyObject>()

final class CustomImageView: UIImageView {
    var task: URLSessionDataTask!
    let spinner = UIActivityIndicatorView(style: .medium)
    
    func loadImageFromStringAndCacheIt(from string: String) {
        guard let url = URL(string: string) else { return }
        
        image = nil
        
        addSpinner()
        
        if let newTask = task {
            newTask.cancel()
        }
        
        if let imageFromCache = imageCache.object(forKey: url.absoluteURL as AnyObject) as? UIImage {
            image = imageFromCache
            removeSpinner()
            
            return
        }

        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let newData = data, let newImage = UIImage(data: newData) else {
                print("Could not load image from url: \(url)")
                
                return
            }
            
            imageCache.setObject(newImage, forKey: url.absoluteURL as AnyObject)
            
            DispatchQueue.main.async { [weak self] in
                self?.image = newImage
                self?.removeSpinner()
            }
        }
        
        task.resume()
    }
    
    func addSpinner() {
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        spinner.startAnimating()
    }
    
    func removeSpinner() {
        spinner.removeFromSuperview()
    }
}
