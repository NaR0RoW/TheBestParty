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
    
    lazy var cocktailsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.width / 2 - 15.0, height: view.width / 2 - 15.0)
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.registerCell(CocktailCollectionViewCell.self)
//        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getCocktails()
        view.addSubview(cocktailsCollectionView)
        setupView()
//        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cocktailsCollectionView.frame = view.bounds
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
                            cocktailType: nil,
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
                    self.cocktailsCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func setupView() {
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

// MARK: - UICollectionViewDataSource
extension CocktailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cocktailsModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cocktail = cocktailsModel[indexPath.row]
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CocktailCollectionViewCell
        cell.configureCell(with: cocktail)

        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CocktailsViewController: UICollectionViewDelegate {
    
}
