import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            addArrangedSubview($0)
        }
    }
}
