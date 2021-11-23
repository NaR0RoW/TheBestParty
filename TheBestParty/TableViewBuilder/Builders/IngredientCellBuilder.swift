import UIKit

class IngredientCellBuilder: TableViewCellBuilder {
    private let height: CGFloat
    private let cocktail: CocktailModel
    
    init(height: CGFloat, cocktail: CocktailModel) {
        self.height = height
        self.cocktail = cocktail
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
    }
    
    func cellHeight() -> CGFloat {
        return height
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as? IngredientCell else {
            return UITableViewCell()
        }
        cell.configureCell(with: cocktail)
        return cell
    }
}
