import UIKit

class CocktailsCollectionViewController: UIViewController {
    var presenter: CocktailsCollectionViewPresenterProtocol?
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Yummy"
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        return searchController
    }()
    
    lazy var cocktailsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.width / 2 - 15.0, height: view.width / 2 - 15.0)
        layout.sectionInset = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.registerCell(CocktailCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        cocktailsCollectionView.frame = view.frame
    }
}

extension CocktailsCollectionViewController {
    private func setupView() {
        view.addSubview(cocktailsCollectionView)
        title = "Cocktails"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
    }
}

extension CocktailsCollectionViewController: CocktailsCollectionViewProtocol {
    func success() {
        cocktailsCollectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

extension CocktailsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.cocktails?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cocktail = presenter?.cocktails?[indexPath.row] else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CocktailCollectionViewCell
        cell.configureCell(with: cocktail)

        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CocktailsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cocktail = presenter?.cocktails?[indexPath.row]
        presenter?.goToDetails(cocktail: cocktail)
    }
}

// MARK: - UIScrollViewDelegate
extension CocktailsCollectionViewController: UIScrollViewDelegate {

}

// MARK: - UISearchBarDelegate
extension CocktailsCollectionViewController: UISearchBarDelegate {

}
