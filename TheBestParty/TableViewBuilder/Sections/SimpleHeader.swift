import UIKit

class SimpleHeaderSection: BaseSection {
    
    private let title: String
    
    init(title: String, builders: [TableViewCellBuilder], tableView: UITableView) {
        self.title = title
        super.init(builders: builders, tableView: tableView)
    }
    
    override func viewForHeader() -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemPink
        
        return view
    }
    
//    guard let tableView = view as? UITableViewHeaderFooterView else { return }
//    tableView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: 0)
//    tableView.contentView.backgroundColor = .systemBackground
//    tableView.textLabel?.font = .systemFont(ofSize: 22.0)
//    tableView.textLabel?.textColor = .systemOrange
    
//    override func heightForHeader() -> CGFloat {
//        return 80
//    }
//
//    override func viewForFooter() -> UIView? {
//        return DividerFooterView(frame: .zero)
//    }
//
//    override func heightForFooter() -> CGFloat {
//        return 20
//    }
}
