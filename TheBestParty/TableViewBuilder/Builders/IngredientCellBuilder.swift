import UIKit

class IngredientCellBuilder: TableViewCellBuilder {
    private let cocktail: CocktailModel
    
    init(cocktail: CocktailModel) {
        self.cocktail = cocktail
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.registerCell(IngredientCell.self)
    }
 
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as IngredientCell
        cell.configureCell(with: cocktail)
        cell.backgroundColor = .systemBackground
        
        return cell
    }
}
