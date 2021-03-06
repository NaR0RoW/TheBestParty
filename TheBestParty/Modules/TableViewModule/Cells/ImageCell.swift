import UIKit

final class ImageCell: UITableViewCell {
    private let cocktailImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30.0, weight: .black)
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
    
    func configureCell(with cocktail: CocktailObject?) {
        guard let imageURLString = cocktail?.cocktailImage else { return }
        cocktailImageView.loadImageFromStringAndCacheIt(from: imageURLString)
        cocktailNameLabel.text = cocktail?.cocktailName
        cocktailCategoryLabel.text = cocktail?.cocktailCategory
        
        setupView()
    }
}

extension ImageCell {
    private func setupView() {
        contentView.addSubview(cocktailImageView)
        NSLayoutConstraint.activate([
            cocktailImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cocktailImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cocktailImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cocktailImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            cocktailImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor)
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
