import UIKit

class ImageCell: UITableViewCell {
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30.0, weight: .black)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 10
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let cocktailCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 10
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public func configureCell(with cocktail: CocktailModel) {
        self.cocktailImageView.loadFromString(from: cocktail.drinks.first?.cocktailImage ?? "")
        self.cocktailNameLabel.text = cocktail.drinks.first?.cocktailName
        self.cocktailCategoryLabel.text = cocktail.drinks.first?.cocktailCategory
        
        setupView()
    }
}

extension ImageCell {
    private func setupView() {
        contentView.addSubview(cocktailImageView)
        NSLayoutConstraint.activate([
            cocktailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cocktailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cocktailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cocktailImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        contentView.addSubview(cocktailNameLabel)
        NSLayoutConstraint.activate([
            cocktailNameLabel.bottomAnchor.constraint(equalTo: cocktailImageView.bottomAnchor, constant: -40.0),
            cocktailNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0)
        ])
        
        contentView.addSubview(cocktailCategoryLabel)
        NSLayoutConstraint.activate([
            cocktailCategoryLabel.topAnchor.constraint(equalTo: cocktailNameLabel.bottomAnchor),
            cocktailCategoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20.0)
        ])
    }
}
