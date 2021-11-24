import UIKit

class ImageCellBuilder: TableViewCellBuilder {
    private let height: CGFloat
    private let cocktail: CocktailModel
    
    init(height: CGFloat, cocktail: CocktailModel) {
        self.height = height
        self.cocktail = cocktail
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.registerCell(ImageCell.self)
    }
    
    func cellHeight() -> CGFloat {
        return height
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ImageCell
        cell.configureCell(with: cocktail)
        cell.backgroundColor = .systemBackground
        
        return cell
    }
}
