import UIKit

protocol TableViewSectionBuilder {
    var builders: [TableViewCellBuilder] { get }
    func viewForHeader() -> UIView?
    func heightForHeader() -> CGFloat
    func viewForFooter() -> UIView?
    func heightForFooter() -> CGFloat
    func numberOfRows() -> Int
    func cellHeight(for indexPath: IndexPath) -> CGFloat
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
}

extension TableViewSectionBuilder {
    func numberOfRows() -> Int {
        return builders.count
    }
    
    func cellHeight(for indexPath: IndexPath) -> CGFloat {
        return builders[indexPath.row].cellHeight()
    }
    
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return builders[indexPath.row].cellAt(indexPath: indexPath, in: tableView)
    }
}
