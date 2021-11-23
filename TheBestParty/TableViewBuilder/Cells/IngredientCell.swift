import UIKit

class IngredientCell: UITableViewCell {
    static let identifier = "IngredientCell"
    // MARK: - Visual Components
    private let firstIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let secondIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let thirdIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let fourthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let ingredientStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let firstIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let secondIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let thirdIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let fourthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let ingredientMeasureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    public func configureCell(with cocktail: CocktailModel) {
        self.firstIngredientLabel.text = cocktail.drinks.first?.cocktailFirstIngredient
        self.secondIngredientLabel.text = cocktail.drinks.first?.cocktailSecondIngredient
        self.thirdIngredientLabel.text = cocktail.drinks.first?.cocktailThirdIngredient
        self.fourthIngredientLabel.text = cocktail.drinks.first?.cocktailFourthIngredient
        
        self.firstIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFirstIngredientMeasure
        self.secondIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailSecondIngredientMeasure
        self.thirdIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailThirdIngredientMeasure
        self.fourthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFourthIngredientMeasure
        setupView()
    }
}

// MARK: - Extensions
extension IngredientCell {
    private func setupView() {
        ingredientStackView.addArrangedSubviews(
            [firstIngredientLabel,
             secondIngredientLabel,
             thirdIngredientLabel,
             fourthIngredientLabel]
        )
        contentView.addSubview(ingredientStackView)
        NSLayoutConstraint.activate([
            ingredientStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            ingredientStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
        ])
        
        ingredientMeasureStackView.addArrangedSubviews(
            [firstIngredientMeasureLabel,
             secondIngredientMeasureLabel,
             thirdIngredientMeasureLabel,
             fourthIngredientMeasureLabel]
        )
        contentView.addSubview(ingredientMeasureStackView)
        NSLayoutConstraint.activate([
            ingredientMeasureStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            ingredientMeasureStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20.0)
        ])
    }
}

