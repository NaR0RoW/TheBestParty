import UIKit

class SimpleHeaderSection: MockSection {
    private let title: String
    
    init(title: String, builders: [TableViewCellBuilder], tableView: UITableView) {
        self.title = title
        super.init(builders: builders, tableView: tableView)
    }
    
    override func viewForHeader() -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemBackground
        let label = UILabel()
        label.text = title
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 20.0, weight: .semibold)
        view.addSubview(label)
        label.frame = CGRect(x: 20, y: 0, width: UIScreen.main.bounds.width, height: heightForHeader())
        
        return view
    }
    
    override func heightForHeader() -> CGFloat {
        return 30.0
    }
}
