import UIKit

class CocktailTableViewCell: UITableViewCell {
    // MARK: - Visual Components
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: "heart.fill", withConfiguration: imageConfiguration)?.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let cocktailCategoryLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let cocktailTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0)
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
// MARK: Extensions
extension CocktailTableViewCell {
    @objc private func addToFavorite() {
        print("Tapped")
    }
    
    private func setupView() {
        contentView.addSubview(cocktailImageView)
        NSLayoutConstraint.activate([
            cocktailImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cocktailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),
            cocktailImageView.widthAnchor.constraint(equalToConstant: 125.0),
            cocktailImageView.heightAnchor.constraint(equalToConstant: 200.0)
        ])
        
        contentView.addSubview(cocktailNameLabel)
        NSLayoutConstraint.activate([
            cocktailNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            cocktailNameLabel.leftAnchor.constraint(equalTo: cocktailImageView.rightAnchor, constant: 25.0),
            cocktailNameLabel.widthAnchor.constraint(equalToConstant: 150.0),
            cocktailNameLabel.heightAnchor.constraint(equalToConstant: 75.0)
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
            cocktailCategoryLabel.leftAnchor.constraint(equalTo: cocktailImageView.rightAnchor, constant: 25.0),
            cocktailCategoryLabel.widthAnchor.constraint(equalToConstant: 150.0),
            cocktailCategoryLabel.heightAnchor.constraint(equalToConstant: 75.0)
        ])
        
        contentView.addSubview(cocktailTypeLabel)
        NSLayoutConstraint.activate([
            cocktailTypeLabel.topAnchor.constraint(equalTo: cocktailCategoryLabel.topAnchor, constant: 25.0),
            cocktailTypeLabel.leftAnchor.constraint(equalTo: cocktailImageView.rightAnchor, constant: 25.0),
            cocktailTypeLabel.widthAnchor.constraint(equalToConstant: 150.0),
            cocktailTypeLabel.heightAnchor.constraint(equalToConstant: 75.0)
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
                self?.cocktailTypeLabel.text = cocktail.drinks.first?.cocktailType
            }
        }
    }
}
