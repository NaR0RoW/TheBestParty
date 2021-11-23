import UIKit

class SomeViewController: UIViewController {
    
    private let cocktails: CocktailModel
    private var dataSource: TableViewDataSourceProtocol
    private var factory: FactoryProtocol?
    
    init(dataSource: TableViewDataSourceProtocol = TableViewDataSource(),
         cocktails: CocktailModel) {
        self.dataSource = dataSource
        self.cocktails = cocktails
        super.init(nibName: nil, bundle: nil)
        setupTableContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .white
        view.separatorStyle = .none
        view.delegate = dataSource
        view.dataSource = dataSource
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.reloadData()
    }
    
    private func setupTableContent() {
        factory = TableViewFactory(model: cocktails, tableView: tableView)
        if let sections = factory?.getSections() {
            dataSource.sections = sections
        }
    }
}
