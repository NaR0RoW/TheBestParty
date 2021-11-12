import UIKit

class CocktailCollectionViewCell: UICollectionViewCell {
    // MARK: - Visual Components
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: "heart.circle.fill", withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
//        button.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    private let cocktailCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CocktailCollectionViewCell {
//    @objc private func addToFavorite() {
//        print("Tapped")
//    }
    
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
            cocktailNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30.0),
            cocktailNameLabel.leftAnchor.constraint(equalTo: cocktailImageView.leftAnchor, constant: 15.0),
        ])

        contentView.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            favoriteButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15.0),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25.0),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25.0)
        ])

        contentView.addSubview(cocktailCategoryLabel)
        NSLayoutConstraint.activate([
            cocktailCategoryLabel.topAnchor.constraint(equalTo: cocktailNameLabel.topAnchor, constant: 25.0),
            cocktailCategoryLabel.leftAnchor.constraint(equalTo: cocktailImageView.leftAnchor, constant: 15.0),
        ])
    }
    
    public func configureCell(with cocktail: CocktailModel) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let url = cocktail.drinks.first?.cocktailImage else { return }
            guard let urlString = URL(string: url) else { return }
            guard let data = try? Data(contentsOf: urlString) else { return }
            DispatchQueue.main.async {
                self?.cocktailImageView.image = UIImage(data: data)
                self?.cocktailNameLabel.text = cocktail.drinks.first?.cocktailName
                self?.cocktailCategoryLabel.text = cocktail.drinks.first?.cocktailCategory
            }
        }
    }
}
