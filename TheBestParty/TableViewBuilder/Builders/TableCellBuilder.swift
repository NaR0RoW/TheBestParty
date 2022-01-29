import UIKit

final class TableCellBuilder: TableViewCellBuilder {
    private let cocktail: CocktailModel
    private let cellType: CellType
    
    init(cocktail: CocktailModel, cellType: CellType) {
        self.cocktail = cocktail
        self.cellType = cellType
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.registerCell(TableCell.self)
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableCell
        cell.configureCell(with: cocktail, type: cellType)
        cell.backgroundColor = .systemBackground
        
        return cell
    }
}
