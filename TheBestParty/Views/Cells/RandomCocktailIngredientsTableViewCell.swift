import UIKit

class RandomCocktailIngredientsTableViewCell: UITableViewCell {
    // MARK: - Visual Components
    private let firstIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let firstIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let secondIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let secondIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let thirdIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let thirdIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let fourthIngredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let fourthIngredientMeasureLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
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
extension RandomCocktailIngredientsTableViewCell {
    public func configureCell(with cocktail: CocktailModel) {
        DispatchQueue.main.async {
            self.firstIngredientLabel.text = cocktail.drinks.first?.cocktailFirstIngredient
            self.secondIngredientLabel.text = cocktail.drinks.first?.cocktailSecondIngredient
            self.thirdIngredientLabel.text = cocktail.drinks.first?.cocktailThirdIngredient
            self.fourthIngredientLabel.text = cocktail.drinks.first?.cocktailFourthIngredient
            
            self.firstIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFirstIngredientMeasure
            self.secondIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailSecondIngredientMeasure
            self.thirdIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailThirdIngredientMeasure
            self.fourthIngredientMeasureLabel.text = cocktail.drinks.first?.cocktailFourthIngredientMeasure
        }
    }
    
    private func setupView() {
        contentView.addSubview(firstIngredientLabel)
        contentView.addSubview(secondIngredientLabel)
        contentView.addSubview(thirdIngredientLabel)
        contentView.addSubview(fourthIngredientLabel)
        
        contentView.addSubview(firstIngredientMeasureLabel)
        contentView.addSubview(secondIngredientMeasureLabel)
        contentView.addSubview(thirdIngredientMeasureLabel)
        contentView.addSubview(fourthIngredientMeasureLabel)
        
        NSLayoutConstraint.activate([
            firstIngredientLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            firstIngredientLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),
            
            secondIngredientLabel.topAnchor.constraint(equalTo: firstIngredientLabel.topAnchor, constant: 15.0),
            secondIngredientLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),

            thirdIngredientLabel.topAnchor.constraint(equalTo: secondIngredientLabel.topAnchor, constant: 15.0),
            thirdIngredientLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),
            
            fourthIngredientLabel.topAnchor.constraint(equalTo: thirdIngredientLabel.topAnchor, constant: 15.0),
            fourthIngredientLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),
            
            firstIngredientMeasureLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            firstIngredientMeasureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15.0),
            
            secondIngredientMeasureLabel.topAnchor.constraint(equalTo: firstIngredientMeasureLabel.topAnchor, constant: 15.0),
            secondIngredientMeasureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15.0),
            
            thirdIngredientMeasureLabel.topAnchor.constraint(equalTo: secondIngredientMeasureLabel.topAnchor, constant: 15.0),
            thirdIngredientMeasureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15.0),
            
            fourthIngredientMeasureLabel.topAnchor.constraint(equalTo: thirdIngredientMeasureLabel.topAnchor, constant: 15.0),
            fourthIngredientMeasureLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15.0)
        ])
    }
}
