import UIKit

final class IngredientCell: UITableViewCell {
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
    
    func configureCell(with cocktail: CocktailObject?) {
        firstIngredientLabel.text = cocktail?.cocktailFirstIngredient
        secondIngredientLabel.text = cocktail?.cocktailSecondIngredient
        thirdIngredientLabel.text = cocktail?.cocktailThirdIngredient
        fourthIngredientLabel.text = cocktail?.cocktailFourthIngredient
        fifthIngredientLabel.text = cocktail?.cocktailFifthIngredient
        sixthIngredientLabel.text = cocktail?.cocktailSixthIngredient
        seventhIngredientLabel.text = cocktail?.cocktailSeventhIngredient
        eighthIngredientLabel.text = cocktail?.cocktailEighthIngredient
        ninthIngredientLabel.text = cocktail?.cocktailNinthIngredient
        tenthIngredientLabel.text = cocktail?.cocktailTenthIngredient
        eleventhIngredientLabel.text = cocktail?.cocktailEleventhIngredient
        twelfthIngredientLabel.text = cocktail?.cocktailTwelfthIngredient
        thirteenthIngredientLabel.text = cocktail?.cocktailThirteenthIngredient
        fourteenthIngredientLabel.text = cocktail?.cocktailFourteenthIngredient
        fifteenthIngredientLabel.text = cocktail?.cocktailFifteenthIngredient
        firstIngredientMeasureLabel.text = cocktail?.cocktailFirstIngredientMeasure
        secondIngredientMeasureLabel.text = cocktail?.cocktailSecondIngredientMeasure
        thirdIngredientMeasureLabel.text = cocktail?.cocktailThirdIngredientMeasure
        fourthIngredientMeasureLabel.text = cocktail?.cocktailFourthIngredientMeasure
        fifthIngredientMeasureLabel.text = cocktail?.cocktailFifthIngredientMeasure
        sixthIngredientMeasureLabel.text = cocktail?.cocktailSixthIngredientMeasure
        seventhIngredientMeasureLabel.text = cocktail?.cocktailSeventhIngredientMeasure
        eighthIngredientMeasureLabel.text = cocktail?.cocktailEighthIngredientMeasure
        ninthIngredientMeasureLabel.text = cocktail?.cocktailNinthIngredientMeasure
        tenthIngredientMeasureLabel.text = cocktail?.cocktailTenthIngredientMeasure
        eleventhIngredientMeasureLabel.text = cocktail?.cocktailEleventhIngredientMeasure
        twelfthIngredientMeasureLabel.text = cocktail?.cocktailTwelfthIngredientMeasure
        thirteenthIngredientMeasureLabel.text = cocktail?.cocktailThirteenthIngredientMeasure
        fourteenthIngredientMeasureLabel.text = cocktail?.cocktailFourteenthIngredientMeasure
        fifteenthIngredientMeasureLabel.text = cocktail?.cocktailFifteenthIngredientMeasure
        
        setupIngredientStackView()
        setupIngredientMeasureStackView()
    }
}

extension IngredientCell {
    private func setupIngredientStackView() {
        ingredientStackView.addArrangedSubviews([
            firstIngredientLabel,
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
             fifteenthIngredientLabel
        ])
        contentView.addSubview(ingredientStackView)
        NSLayoutConstraint.activate([
            ingredientStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            ingredientStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            ingredientStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
            ingredientStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20.0)
        ])
    }
    
    private func setupIngredientMeasureStackView() {
        ingredientMeasureStackView.addArrangedSubviews([
            firstIngredientMeasureLabel,
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
             fifteenthIngredientMeasureLabel
        ])
        contentView.addSubview(ingredientMeasureStackView)
        NSLayoutConstraint.activate([
            ingredientMeasureStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            ingredientMeasureStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            ingredientMeasureStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0),
            ingredientMeasureStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20.0)
        ])
    }
}
