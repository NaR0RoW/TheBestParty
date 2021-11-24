import UIKit

class CocktailDetailsViewController: UIViewController {
    private var factory: FactoryProtocol?
    
    var presenter: CocktailDetailsViewPresenterProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.setupDetails()
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
    }
}

extension CocktailDetailsViewController {
    private func setupView() {
        view.addSubview(tableView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .done, target: self, action: #selector(tap))
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    @objc private func tap() {
        print("tapped")
    }
    
    func setupDetails(with cocktail: CocktailModel?, with dataSource: TableViewDataSourceProtocol?) {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        
        guard let cocktail = cocktail else { return }
        
        factory = TableViewFactory(model: cocktail, tableView: tableView)
        if let sections = factory?.getSections() {
            dataSource?.sections = sections
        }
    }
}
