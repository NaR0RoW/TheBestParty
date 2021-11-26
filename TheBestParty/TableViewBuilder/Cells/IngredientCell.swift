import UIKit

class IngredientCell: UITableViewCell {
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
    
    private let fifthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()

    private let sixthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()

    private let seventhIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
      
    private let eighthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let ninthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let tenthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let eleventhIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let twelfthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let thirteenthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let fourteenthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let fifteenthIngredientLabel: UILabel = {
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
    
    private let fifthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()

    private let sixthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()

    private let seventhIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
      
    private let eighthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let ninthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let tenthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let eleventhIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let twelfthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let thirteenthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let fourteenthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        
        return label
    }()
    
    private let fifteenthIngredientMeasureLabel: UILabel = {
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
        self.fifthIngredientLabel.text = cocktail.drinks.first?.cocktailFifthIngredient
        self.sixthIngredientLabel.text = cocktail.drinks.first?.cocktailSixthIngredient
        self.seventhIngredientLabel.text = cocktail.drinks.first?.cocktailSeventhIngredient
        self.eighthIngredientLabel.text = cocktail.drinks.first?.cocktailEighthIngredient
        self.ninthIngredientLabel.text = cocktail.drinks.first?.cocktailNinthIngredient
        self.tenthIngredientLabel.text = cocktail.drinks.first?.cocktailTenthIngredient
        self.eleventhIngredientLabel.text = cocktail.drinks.first?.cocktailEleventhIngredient
        self.twelfthIngredientLabel.text = cocktail.drinks.first?.cocktailTwelfthIngredient
        self.thirteenthIngredientLabel.text = cocktail.drinks.first?.cocktailThirteenthIngredient
        self.fourteenthIngredientLabel.text = cocktail.drinks.first?.cocktailFourteenthIngredient
        self.fifteenthIngredientLabel.text = cocktail.drinks.first?.cocktailFifteenthIngredient
        self.firstIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFirstIngredientMeasure
        self.secondIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailSecondIngredientMeasure
        self.thirdIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailThirdIngredientMeasure
        self.fourthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFourthIngredientMeasure
        self.fifthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFifthIngredientMeasure
        self.sixthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailSixthIngredientMeasure
        self.seventhIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailSeventhIngredientMeasure
        self.eighthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailEighthIngredientMeasure
        self.ninthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailNinthIngredientMeasure
        self.tenthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailTenthIngredientMeasure
        self.eleventhIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailEleventhIngredientMeasure
        self.twelfthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailTwelfthIngredientMeasure
        self.thirteenthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailThirteenthIngredientMeasure
        self.fourteenthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFourteenthIngredientMeasure
        self.fifteenthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFifteenthIngredientMeasure
        
        setupView()
    }
}

extension IngredientCell {
    private func setupView() {
        ingredientStackView.addArrangedSubviews(
            [firstIngredientLabel,
             secondIngredientLabel,
             thirdIngredientLabel,
             fourthIngredientLabel,
             fifthIngredientLabel,
             sixthIngredientLabel,
             seventhIngredientLabel,
             eighthIngredientLabel,
             ninthIngredientLabel,
             tenthIngredientLabel,
             eleventhIngredientLabel,
             twelfthIngredientLabel,
             thirteenthIngredientLabel,
             fourteenthIngredientLabel,
             fifteenthIngredientLabel]
        )
        contentView.addSubview(ingredientStackView)
        NSLayoutConstraint.activate([
            ingredientStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            ingredientStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            ingredientStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
            ingredientStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20.0)
        ])
        
        ingredientMeasureStackView.addArrangedSubviews(
            [firstIngredientMeasureLabel,
             secondIngredientMeasureLabel,
             thirdIngredientMeasureLabel,
             fourthIngredientMeasureLabel,
             fifthIngredientMeasureLabel,
             sixthIngredientMeasureLabel,
             seventhIngredientMeasureLabel,
             eighthIngredientMeasureLabel,
             ninthIngredientMeasureLabel,
             tenthIngredientMeasureLabel,
             eleventhIngredientMeasureLabel,
             twelfthIngredientMeasureLabel,
             thirteenthIngredientMeasureLabel,
             fourteenthIngredientMeasureLabel,
             fifteenthIngredientMeasureLabel]
        )
        contentView.addSubview(ingredientMeasureStackView)
        NSLayoutConstraint.activate([
            ingredientMeasureStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            ingredientMeasureStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            ingredientMeasureStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
            ingredientMeasureStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20.0)
        ])
    }
}
