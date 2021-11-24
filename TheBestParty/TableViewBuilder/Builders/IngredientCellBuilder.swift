import UIKit

class IngredientCellBuilder: TableViewCellBuilder {
//    private let height: CGFloat
    private let cocktail: CocktailModel
    
    init(cocktail: CocktailModel) {
//        self.height = height
        self.cocktail = cocktail
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.registerCell(IngredientCell.self)
    }
    
//    func cellHeight() -> CGFloat {
//        return height
//    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as IngredientCell
        cell.configureCell(with: cocktail)
        cell.backgroundColor = .systemBackground
        
        return cell
    }
}
