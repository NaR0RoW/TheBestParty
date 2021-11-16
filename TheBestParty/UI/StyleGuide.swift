import UIKit

extension CGFloat {
    static let superTextSize: CGFloat = 30.0
    static let headerSize: CGFloat = 22.0
    static let subHeaderSize: CGFloat = 18.0
}

extension UILabel {
    public func configureSuperHeaderLabel() {
        configure(size: .superTextSize, weight: .black, lines: 0)
    }
    
    public func configureHeaderLabel() {
        configure(size: .headerSize, weight: .bold, lines: 0)
    }
    
    public func configureSubHeaderLabel() {
        configure(size: .subHeaderSize, weight: .semibold, lines: 1)
    }
    
    private func configure(
        size: CGFloat,
        weight: UIFont.Weight,
        lines: Int
    ) {
        font = UIFont.systemFont(ofSize: size, weight: weight)
        textColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        numberOfLines = lines
    }
}

extension UIButton {
    public func configureShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
    }
}
