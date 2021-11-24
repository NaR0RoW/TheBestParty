import UIKit

class ImageCell: UITableViewCell {
    var previousUrlString: String?
//    private let backButton: UIButton = {
//        let button = UIButton()
//        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .bold, scale: .large)
//        let image = UIImage(systemName: "heart.circle.fill", withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
//        button.setImage(image, for: .normal)
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOpacity = 1
//        button.layer.shadowOffset = .zero
//        button.layer.shadowRadius = 10
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        return button
//    }()
    
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
        ImageDownloader.shared.downloadImage(with: cocktail.drinks.first?.cocktailImage, completionHandler: { image, cached in
            if cached || cocktail.drinks.first?.cocktailImage == self.previousUrlString {
                self.cocktailImageView.image = image
            }
        }, placeholderImage: UIImage(systemName: "person.fill"))
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
