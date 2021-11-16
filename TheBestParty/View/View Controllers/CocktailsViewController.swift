import UIKit

class CocktailsViewController: UIViewController {
    // MARK: - Properties
    private let networkManager: NetworkProvider = NetworkManager()
    private var cocktailsModel = [CocktailModel]()
    private var timer: Timer?
    
    // MARK: - Visual Components
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Yummy"
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.searchBar.autocapitalizationType = .none
        
        return searchController
    }()
    
    lazy var cocktailsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.width / 2 - 15.0, height: view.width / 2 - 15.0)
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.registerCell(CocktailCollectionViewCell.self)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getCocktails(searchItem: "")
        view.addSubview(cocktailsCollectionView)
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cocktailsCollectionView.frame = view.frame
    }
}

// MARK: - Extensions
extension CocktailsViewController {
    private func setupView() {
        title = "Cocktails"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
    
    private func getCocktails(searchItem: String) {
        networkManager.getCocktails(searchItem: searchItem) { result in
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
                    self.cocktailsCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UISearchBarDelegate
extension CocktailsViewController: UISearchBarDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension CocktailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cocktailsModel.count
//        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cocktail = cocktailsModel[indexPath.row]
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CocktailCollectionViewCell
        cell.configureCell(with: cocktail)

        return cell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .systemBlue
//
//        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CocktailsViewController: UICollectionViewDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        if text != "" {
            timer?.invalidate()
            self.timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
                self?.getCocktails(searchItem: text ?? "")
            }
        }
    }
}

// MARK: - UIScrollViewDelegate
extension CocktailsViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}
