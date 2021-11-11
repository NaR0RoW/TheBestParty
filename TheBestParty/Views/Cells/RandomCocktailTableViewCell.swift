import UIKit

class RandomCocktailTableViewCell: UITableViewCell {
    private var cellModel: CellModel!
    
    // MARK: - Visual Components
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension RandomCocktailTableViewCell {
    func configureCell(with cocktail: CocktailModel) {
        switch cellModel {
        
        default:
            ""
        }
        DispatchQueue.main.async {
            self.descriptionLabel.text = cocktail.drinks.first?.cocktailInstructions
        }
    }
    
    private func setupView() {
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15.0)
        ])
    }
}
