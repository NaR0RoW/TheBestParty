import UIKit

final class TableCell: UITableViewCell {
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    func configureCell(with cocktail: CocktailObject?, type: CellType) {
        switch type {
        case .type:
            descriptionLabel.text = cocktail?.cocktailType
        case .instructions:
            descriptionLabel.text = cocktail?.cocktailInstructions
        case .category:
            descriptionLabel.text = cocktail?.cocktailCategory
        case .glass:
            descriptionLabel.text = cocktail?.cocktailGlass
        case .ingredients:
            break
        }
        
        setupView()
    }
}

extension TableCell {
    private func setupView() {
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20.0)
        ])
    }
}
