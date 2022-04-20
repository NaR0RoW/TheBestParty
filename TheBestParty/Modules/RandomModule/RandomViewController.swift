import UIKit

final class RandomViewController: UIViewController {
    private var factory: FactoryProtocol?
    var presenter: RandomPresenterProtocol?
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()
    
    private let refreshButton: UIButton = {
        let button = UIButton()
        button.createShadowButtonWithSystemImage(with: "arrow.counterclockwise.circle")
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.createShadowButtonWithSystemImage(with: "heart.circle.fill")
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
        
        presenter?.highlightFavoriteCocktail()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension RandomViewController {
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
        view.addSubview(favoriteButton)
        favoriteButton.addTarget(self, action: #selector(tapToFavorite), for: .touchUpInside)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            favoriteButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0)
        ])
        
        view.addSubview(refreshButton)
        refreshButton.addTarget(self, action: #selector(refresh), for: .touchUpInside)
        NSLayoutConstraint.activate([
            refreshButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            refreshButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0)
        ])
    }
}

extension RandomViewController: RandomViewProtocol {
    func success(with dataSource: TableViewDataSourceProtocol?) {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        
        guard let cocktail = presenter?.cocktail else { return }
    
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
        favoriteButton.tintColor = .white
    }
    
    @objc private func tapToFavorite() {
        favoriteButton.tintColor = .systemOrange
        presenter?.addToFavorite()
    }
    
    func highlightFavoriteCocktail() {
        favoriteButton.tintColor = .systemOrange
    }
}
