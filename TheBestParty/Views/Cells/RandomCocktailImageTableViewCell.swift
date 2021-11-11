import UIKit

class RandomCocktailImageTableViewCell: UITableViewCell {
    // MARK: - Visual Components
    private let cocktailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let cocktailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
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
extension RandomCocktailImageTableViewCell {
    func configureCell(with cocktail: CocktailModel) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let url = cocktail.drinks.first?.cocktailImage else { return }
            guard let urlString = URL(string: url) else { return }
            guard let data = try? Data(contentsOf: urlString) else { return }
            DispatchQueue.main.async {
                self?.cocktailImageView.image = UIImage(data: data)
                self?.cocktailNameLabel.text = cocktail.drinks.first?.cocktailName
                self?.cocktailDescriptionLabel.text = cocktail.drinks.first?.cocktailCategory
            }
        }
    }
    
    private func setupView() {
        contentView.addSubview(cocktailImageView)
        contentView.addSubview(cocktailNameLabel)
        contentView.addSubview(cocktailDescriptionLabel)
        
        NSLayoutConstraint.activate([
            cocktailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cocktailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cocktailImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cocktailImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            cocktailNameLabel.bottomAnchor.constraint(equalTo: cocktailImageView.bottomAnchor, constant: -30.0),
            cocktailNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0),
            
            cocktailDescriptionLabel.topAnchor.constraint(equalTo: cocktailNameLabel.bottomAnchor),
            cocktailDescriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15.0)
        ])
    }
}
