import UIKit

class TableCellBuilder: TableViewCellBuilder {
//    private let height: CGFloat
    private let cocktail: CocktailModel
    private let cellType: CellType
    
    init(cocktail: CocktailModel, cellType: CellType) {
//        self.height = height
        self.cocktail = cocktail
        self.cellType = cellType
    }
    
    func registerCell(in tableView: UITableView) {
        tableView.registerCell(TableCell.self)
    }
    
//    func cellHeight() -> CGFloat {
//        return height
//    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TableCell
        cell.configureCell(with: cocktail, type: cellType)
        cell.backgroundColor = .systemBackground
        
        return cell
    }
}