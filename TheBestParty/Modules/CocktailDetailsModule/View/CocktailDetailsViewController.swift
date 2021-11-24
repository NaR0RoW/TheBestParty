import UIKit

class CocktailDetailsViewController: UIViewController {
    private let cocktails: CocktailModel
    private var dataSource: TableViewDataSourceProtocol
    private var factory: FactoryProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        return tableView
    }()

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
