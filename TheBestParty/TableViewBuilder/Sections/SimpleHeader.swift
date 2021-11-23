import UIKit

class SimpleHeaderSection: MockSection {
    private let title: String
    
    init(title: String, builders: [TableViewCellBuilder], tableView: UITableView) {
        self.title = title
        super.init(builders: builders, tableView: tableView)
    }
    
    override func viewForHeader() -> UIView? {
        let view = UIView()
        let label = UILabel()
        label.text = title
        view.addSubview(label)
        label.frame = CGRect(x: 15, y: 0, width: 100, height: 80)
        view.backgroundColor = .systemPink
        
        return view
    }
    
    override func heightForHeader() -> CGFloat {
        return 80
    }
}
