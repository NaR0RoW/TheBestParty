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
    
    private let backButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
        let imageConfiguration = UIImage.SymbolConfiguration(pointSize: 25.0, weight: .bold, scale: .large)
        let image = UIImage(systemName: "arrow.backward.circle.fill", withConfiguration: imageConfiguration)?.withTintColor(.white, renderingMode: .alwaysOriginal)
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
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
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
        setupView()
        setupTopItems()
        presenter?.setupDetails()
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.frame
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

extension CocktailDetailsViewController {
    private func setupView() {
        view.addSubview(tableView)
    }
    
    private func setupTopItems() {
        view.addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0)
        ])
        
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0)
        ])
    }
}

extension CocktailDetailsViewController: CocktailDetailsViewProtocol {
    @objc private func tap() {
        print("tapped")
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
}
