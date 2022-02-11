import UIKit

final class CocktailDetailsViewController: UIViewController {
    private var factory: FactoryProtocol?
    
    var presenter: CocktailDetailsViewPresenterProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
        button.createShadowButtonWithSystemImage(with: "arrow.backward.circle.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        button.createShadowButtonWithSystemImage(with: "heart.circle.fill")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTopItems()
        presenter?.setupDetails()
        tableView.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
        presenter?.highlightFavoriteCocktail()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension CocktailDetailsViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupTopItems() {
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0)
        ])
        
        view.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            favoriteButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0)
        ])
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    @objc private func addToFavorite() {
        favoriteButton.tintColor = .systemOrange
        presenter?.addToFavorite()
    }
    
    @objc private func popToRoot() {
        presenter?.popToRoot()
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
    
    func highlightFavoriteCocktail() {
        favoriteButton.tintColor = .systemOrange
    }
}
