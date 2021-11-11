import UIKit

class RandomCocktailTableViewCell: UITableViewCell {
    // MARK: - Visual Components
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
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
    public func configureInstructionsCell(with cocktail: CocktailModel) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = cocktail.drinks.first?.cocktailInstructions
        }
    }
    
    public func configureCategoryCell(with cocktail: CocktailModel) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = cocktail.drinks.first?.cocktailCategory
        }
    }
    
    public func configureCocktailTypeCell(with cocktail: CocktailModel) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = cocktail.drinks.first?.cocktailType
        }
    }
    
    public func configureGlassCell(with cocktail: CocktailModel) {
        DispatchQueue.main.async {
            self.descriptionLabel.text = cocktail.drinks.first?.cocktailGlass
        }
    }
    
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
