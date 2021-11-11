import UIKit.UIStackView

extension UIStackView {
    public func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            self.addArrangedSubview($0)
        }
    }
}
