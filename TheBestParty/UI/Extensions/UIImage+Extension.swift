import UIKit.UIImageView

extension UIImageView {
    func loadFromString(from string: String) {
        guard let url = URL(string: string) else { return }
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
