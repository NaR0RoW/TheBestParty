import UIKit

class RandomCocktailViewController: UIViewController {
    private var factory: FactoryProtocol?
    
    var presenter: RandomCocktailViewPresenterProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    private let refreshButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(refresh), for: .touchUpInside)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: "arrow.counterclockwise.circle", withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: "heart.circle.fill", withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 1.0
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10.0
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTopItems()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension RandomCocktailViewController {
    private func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupTopItems() {
        view.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            favoriteButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0)
        ])
        
        view.addSubview(refreshButton)
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30.0),
            refreshButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0)
        ])
    }
}

extension RandomCocktailViewController: RandomCocktailViewProtocol {
    func success(with cocktail: CocktailModel?, with dataSource: TableViewDataSourceProtocol?) {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource

        guard let cocktail = cocktail else { return }

        factory = TableViewFactory(model: cocktail, tableView: tableView)
        if let sections = factory?.getSections() {
            dataSource?.sections = sections
        }
        
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    @objc private func refresh() {
        presenter?.refresh()
    }
    
    @objc private func addToFavorite() {
        print("Added to favorite")
    }
}
