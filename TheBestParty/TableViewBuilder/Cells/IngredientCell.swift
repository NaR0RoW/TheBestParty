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
    
    public func configureCell(with cocktail: CocktailObject?) {
        self.firstIngredientLabel.text = cocktail?.cocktailFirstIngredient
        self.secondIngredientLabel.text = cocktail?.cocktailSecondIngredient
        self.thirdIngredientLabel.text = cocktail?.cocktailThirdIngredient
        self.fourthIngredientLabel.text = cocktail?.cocktailFourthIngredient
        self.fifthIngredientLabel.text = cocktail?.cocktailFifthIngredient
        self.sixthIngredientLabel.text = cocktail?.cocktailSixthIngredient
        self.seventhIngredientLabel.text = cocktail?.cocktailSeventhIngredient
        self.eighthIngredientLabel.text = cocktail?.cocktailEighthIngredient
        self.ninthIngredientLabel.text = cocktail?.cocktailNinthIngredient
        self.tenthIngredientLabel.text = cocktail?.cocktailTenthIngredient
        self.eleventhIngredientLabel.text = cocktail?.cocktailEleventhIngredient
        self.twelfthIngredientLabel.text = cocktail?.cocktailTwelfthIngredient
        self.thirteenthIngredientLabel.text = cocktail?.cocktailThirteenthIngredient
        self.fourteenthIngredientLabel.text = cocktail?.cocktailFourteenthIngredient
        self.fifteenthIngredientLabel.text = cocktail?.cocktailFifteenthIngredient
        self.firstIngredientMeasureLabel.text = cocktail?.cocktailFirstIngredientMeasure
        self.secondIngredientMeasureLabel.text = cocktail?.cocktailSecondIngredientMeasure
        self.thirdIngredientMeasureLabel.text = cocktail?.cocktailThirdIngredientMeasure
        self.fourthIngredientMeasureLabel.text = cocktail?.cocktailFourthIngredientMeasure
        self.fifthIngredientMeasureLabel.text = cocktail?.cocktailFifthIngredientMeasure
        self.sixthIngredientMeasureLabel.text = cocktail?.cocktailSixthIngredientMeasure
        self.seventhIngredientMeasureLabel.text = cocktail?.cocktailSeventhIngredientMeasure
        self.eighthIngredientMeasureLabel.text = cocktail?.cocktailEighthIngredientMeasure
        self.ninthIngredientMeasureLabel.text = cocktail?.cocktailNinthIngredientMeasure
        self.tenthIngredientMeasureLabel.text = cocktail?.cocktailTenthIngredientMeasure
        self.eleventhIngredientMeasureLabel.text = cocktail?.cocktailEleventhIngredientMeasure
        self.twelfthIngredientMeasureLabel.text = cocktail?.cocktailTwelfthIngredientMeasure
        self.thirteenthIngredientMeasureLabel.text = cocktail?.cocktailThirteenthIngredientMeasure
        self.fourteenthIngredientMeasureLabel.text = cocktail?.cocktailFourteenthIngredientMeasure
        self.fifteenthIngredientMeasureLabel.text = cocktail?.cocktailFifteenthIngredientMeasure
        
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
