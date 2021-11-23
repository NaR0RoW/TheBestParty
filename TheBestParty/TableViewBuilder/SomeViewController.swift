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
//        self.navigationController?.isNavigationBarHidden = true
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

//class CocktailDetailsViewController: UIViewController {
//    var presenter: CocktailDetailsViewPresenter!
//    private var dataSource: TableViewDataSourceProtocol?
//    private var factory: FactoryProtocol?
//
//    private lazy var tableView: UITableView = {
//        let view = UITableView(frame: .zero, style: .grouped)
//        view.backgroundColor = .white
//        view.separatorStyle = .none
//        view.delegate = dataSource
//        view.dataSource = dataSource
//        return view
//    }()
    
//    init(dataSource: TableViewDataSourceProtocol = TableViewDataSource(),
//         cocktails: CocktailModel) {
//        self.dataSource = dataSource
//        self.presenter.cocktail = cocktails
//        super.init(nibName: nil, bundle: nil)
//        setupTableContent()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    init(dataSource: TableViewDataSourceProtocol = TableViewDataSource()) {
//        super.init(nibName: nil, bundle: nil)
//        setupTableContent()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.addSubview(tableView)
//
//        presenter.setCocktail()
//        tableView.reloadData()
//        presenter.setCocktail()
//        tableView.reloadData()
//    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        tableView.frame = view.frame
//    }
    
//    private func setupTableContent() {
//        factory = TableViewFactory(model: presenter.cocktail!, tableView: tableView)
//        if let sections = factory?.getSections() {
//            dataSource?.sections = sections
//        }
//    }
//}

//extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
//    func setupDetails(with cocktail: CocktailModel?) {
//        guard let cocktail = cocktail else {
//            return
//        }
//        factory = TableViewFactory(model: cocktail, tableView: tableView)
//        if let sections = factory?.getSections() {
//            dataSource?.sections = sections
//        }
//    }
//}

