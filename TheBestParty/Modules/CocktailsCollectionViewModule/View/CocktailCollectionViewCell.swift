import Kingfisher
import UIKit

final class CocktailCollectionViewCell: UICollectionViewCell {    
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 10.0
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let cocktailCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .semibold)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 10.0
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let cocktailTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .semibold)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOpacity = 1.0
        label.layer.shadowOffset = .zero
        label.layer.shadowRadius = 10.0
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CocktailCollectionViewCell {
    public func configureCell(with cocktail: CocktailModelObject) {
        
        print("SI 1: ", cocktail.drinks.first)
        print("SI 2.1: ", Array(cocktail.drinks))
        print("SI 2.2: ", cocktail.drinks)
//        guard let url = URL(string: cocktail.drinks.first?.cocktailImage ?? "") else { return }
//        self.cocktailImageView.kf.setImage(with: url)
        print("1: ", cocktail.drinks.first?.cocktailName as Any)
        print("2: ", cocktail.drinks.first?.cocktailCategory as Any)
        print("3: ", cocktail.drinks.first?.cocktailType as Any)
        print("------------------------")
        
        self.cocktailNameLabel.text = cocktail.drinks.first?.cocktailName
        self.cocktailCategoryLabel.text = cocktail.drinks.first?.cocktailCategory
        self.cocktailTypeLabel.text = cocktail.drinks.first?.cocktailType
    }

    private func setupView() {
        contentView.addSubview(cocktailImageView)
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cocktailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cocktailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cocktailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])

        contentView.addSubview(cocktailNameLabel)
        NSLayoutConstraint.activate([
            cocktailNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            cocktailNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0),
            cocktailNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0)
        ])

        contentView.addSubview(cocktailCategoryLabel)
        NSLayoutConstraint.activate([
            cocktailCategoryLabel.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50.0),
            cocktailCategoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0),
            cocktailCategoryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0)
        ])
        
        contentView.addSubview(cocktailTypeLabel)
        NSLayoutConstraint.activate([
            cocktailTypeLabel.topAnchor.constraint(equalTo: cocktailCategoryLabel.bottomAnchor),
            cocktailTypeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0),
            cocktailTypeLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0)
        ])
    }
}
