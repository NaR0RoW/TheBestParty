import UIKit.UIButton

extension UIButton {
    func createShadowButtonWithSystemImage(with image: String) {
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: image, withConfiguration: imageConfiguration)
        tintColor = .white
        setImage(image, for: .normal)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
        layer.shadowRadius = 10.0
    }
}
