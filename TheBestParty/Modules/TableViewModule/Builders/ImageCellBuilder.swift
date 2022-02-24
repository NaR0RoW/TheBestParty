import UIKit

final class ImageCellBuilder: TableViewCellBuilder {
    private let cocktail: CocktailObject
    
    init(cocktail: CocktailObject) {
        self.cocktail = cocktail
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.registerCell(ImageCell.self)
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ImageCell
        cell.configureCell(with: cocktail)
        
        return cell
    }
}
