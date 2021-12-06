import Kingfisher
import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {    
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

    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.createShadowButtonWithSystemImage(with: "heart.circle.fill")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
               
        self.cocktailImageView.image = nil
    }
}

extension CocktailCollectionViewCell {
    public func configureCell(with cocktail: CocktailModel) {
        guard let url = URL(string: cocktail.drinks.first?.cocktailImage ?? "") else { return }
        self.cocktailImageView.kf.setImage(with: url)
        
        self.cocktailNameLabel.text = cocktail.drinks.first?.cocktailName
        self.cocktailCategoryLabel.text = cocktail.drinks.first?.cocktailCategory
        self.cocktailTypeLabel.text = cocktail.drinks.first?.cocktailType
    }
    
//    public func configureRealmCell(with realmCocktail: CocktailRealmModel) {
//        guard let url = URL(string: realmCocktail.cocktailsRealm?.drinks.first?.cocktailImage ?? "") else { return }
//        self.cocktailImageView.kf.setImage(with: url)
//
//        self.cocktailNameLabel.text = realmCocktail.cocktailsRealm?.drinks.first?.cocktailName
//        self.cocktailCategoryLabel.text = realmCocktail.cocktailsRealm?.drinks.first?.cocktailCategory
//        self.cocktailTypeLabel.text = realmCocktail.cocktailsRealm?.drinks.first?.cocktailType
//    }
    
    private func setupView() {
        contentView.addSubview(cocktailImageView)
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cocktailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cocktailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cocktailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
        ])
        
        contentView.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            favoriteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5.0),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30.0),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30.0)
        ])
        
        contentView.addSubview(cocktailNameLabel)
        NSLayoutConstraint.activate([
            cocktailNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            cocktailNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10.0),
            cocktailNameLabel.rightAnchor.constraint(equalTo: favoriteButton.leftAnchor, constant: -10.0)
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
