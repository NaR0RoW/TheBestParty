import UIKit

protocol TableViewCellBuilder {
    func registerCell(in tableView: UITableView)
//    func cellHeight() -> CGFloat
    func cellAt(indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
}
