import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {
    var previousUrlString: String?
    
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
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: "heart.circle.fill", withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10.0
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
}

extension CocktailCollectionViewCell {
    public func configureCell(with cocktail: CocktailModel) {
//        self.cocktailImageView.loadFromString(from: cocktail.drinks.first?.cocktailImage ?? "")
        ImageDownloader.shared.downloadImage(with: cocktail.drinks.first?.cocktailImage, completionHandler: { image, cached in
            if cached || cocktail.drinks.first?.cocktailImage == self.previousUrlString {
                self.cocktailImageView.image = image
            }
        }, placeholderImage: UIImage(systemName: "person.fill"))
        previousUrlString = cocktail.drinks.first?.cocktailImage
        
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
