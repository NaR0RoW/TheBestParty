import UIKit.UIButton

extension UIButton {
    public func createShadowButtonWithSystemImage(with image: String) {
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: image, withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        setImage(image, for: .normal)
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1.0
        layer.shadowOffset = .zero
        layer.shadowRadius = 10.0
    }
}
