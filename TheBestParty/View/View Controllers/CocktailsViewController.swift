import UIKit

class CocktailsViewController: UIViewController {
    // MARK: - Properties
    private let networkManager: NetworkProvider = NetworkManager()
    private var cocktailsModel = [CocktailModel]()
    
    // MARK: - Visual Components
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Yummy"
        searchController.searchBar.delegate = self
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.autocapitalizationType = .none
        
        return searchController
    }()
    
    lazy var cocktailsTableView: UITableView = {
        let tableView = UITableView()
        tableView.registerCell(CocktailTableViewCell.self)
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCocktails()
        view.addSubview(cocktailsTableView)
        setupView()
//        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cocktailsTableView.frame = view.bounds
    }
}

// MARK: - Extensions
extension CocktailsViewController {
    private func getCocktails() {
        networkManager.getCocktails { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.cocktailsModel = data.drinks.compactMap {
                        CocktailModel(drinks: [Cocktail(
                            cocktailName: $0.cocktailName,
                            cocktailCategory: $0.cocktailCategory,
                            cocktailGlass: nil,
                            cocktailInstructions: nil,
                            cocktailImage: $0.cocktailImage,
                            cocktailType: $0.cocktailType,
                            cocktailFirstIngredient: nil,
                            cocktailSecondIngredient: nil,
                            cocktailThirdIngredient: nil,
                            cocktailFourthIngredient: nil,
                            cocktailFirstIngredientMeasure: nil,
                            cocktailSecondIngredientMeasure: nil,
                            cocktailThirdIngredientMeasure: nil,
                            cocktailFourthIngredientMeasure: nil
                        )])
                    }
                    self.cocktailsTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Cocktails"
//        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
//    private func setupConstraints() {
//        view.addSubview(cocktailsTableView)
//        NSLayoutConstraint.activate([
//            cocktailsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            cocktailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            cocktailsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//            cocktailsTableView.rightAnchor.constraint(equalTo: view.rightAnchor)
//        ])
//    }
}

// MARK: - UISearchBarDelegate
extension CocktailsViewController: UISearchBarDelegate {
    
}

// MARK: - UITableViewDataSource
extension CocktailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktailsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as CocktailTableViewCell
        let cocktail = cocktailsModel[indexPath.row]
        cell.configureCell(with: cocktail)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CocktailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}
