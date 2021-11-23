import UIKit

class ImageCellBuilder: TableViewCellBuilder {
    private let height: CGFloat
    private let image: UIImage
    private let cocktail: CocktailModel
    
    init(height: CGFloat, image: UIImage, cocktail: CocktailModel) {
        self.height = height
        self.image = image
        self.cocktail = cocktail
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.identifier)
    }
    
    func cellHeight() -> CGFloat {
        return height
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UITableViewCell()
        }
        cell.configureCell(image: image, with: cocktail)
        return cell
    }
}
