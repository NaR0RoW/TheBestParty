import UIKit

final class CollectionViewController: UIViewController {
    var presenter: CollectionPresenterProtocol?
    
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
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerCell(CollectionViewCell.self)
        collectionView.refreshControl = refreshControl
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    private let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        
        return refreshControl
    }()
    
    private let noResultsView: UIView = {
        let view = UIView()
        view.alpha = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let noResultsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noResults")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let noResultsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30.0, weight: .bold)
        label.text = "No results found"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let noResultsSubLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Make sure all word are spelled correctly of try different keywords."
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollectionView()
        setupNoResultsView()
    }
}

extension CollectionViewController {
    private func setupView() {
        view.addSubview(cocktailsCollectionView)
        view.backgroundColor = .systemBackground
        title = "Cocktails"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    private func setupCollectionView() {
        view.addSubview(cocktailsCollectionView)
        NSLayoutConstraint.activate([
            cocktailsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            cocktailsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            cocktailsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cocktailsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    private func setupNoResultsView() {
        view.addSubview(noResultsView)
        NSLayoutConstraint.activate([
            noResultsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25.0),
            noResultsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0),
            noResultsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0),
            noResultsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15.0)
        ])
        
        noResultsView.addSubview(noResultsImage)
        NSLayoutConstraint.activate([
            noResultsImage.topAnchor.constraint(equalTo: noResultsView.topAnchor),
            noResultsImage.centerXAnchor.constraint(equalTo: noResultsView.centerXAnchor),
            noResultsImage.widthAnchor.constraint(equalTo: noResultsView.widthAnchor),
            noResultsImage.heightAnchor.constraint(equalTo: noResultsView.widthAnchor)
        ])
        
        noResultsView.addSubview(noResultsHeaderLabel)
        NSLayoutConstraint.activate([
            noResultsHeaderLabel.topAnchor.constraint(equalTo: noResultsImage.bottomAnchor, constant: 25.0),
            noResultsHeaderLabel.centerXAnchor.constraint(equalTo: noResultsView.centerXAnchor)
        ])
        
        noResultsView.addSubview(noResultsSubLabel)
        NSLayoutConstraint.activate([
            noResultsSubLabel.topAnchor.constraint(equalTo: noResultsHeaderLabel.bottomAnchor, constant: 25.0),
            noResultsSubLabel.leftAnchor.constraint(equalTo: noResultsView.leftAnchor, constant: 15.0),
            noResultsSubLabel.rightAnchor.constraint(equalTo: noResultsView.rightAnchor, constant: -15.0)
        ])
    }
    
    @objc private func refresh() {
        presenter?.refresh()
        refreshControl.endRefreshing()
    }
}

extension CollectionViewController: CollectionViewProtocol {
    func success() {
        noResultsView.alpha = 0.0
        cocktailsCollectionView.alpha = 1.0
        cocktailsCollectionView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
        cocktailsCollectionView.alpha = 0.0
        cocktailsCollectionView.reloadData()
        noResultsView.alpha = 1.0
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.cocktails?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cocktail = presenter?.cocktails?[indexPath.row] else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CollectionViewCell
        cell.configureCell(with: cocktail)

        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cocktail = presenter?.cocktails?[indexPath.row]
        presenter?.goToDetails(cocktail: cocktail)
    }
}

// MARK: - UIScrollViewDelegate
extension CollectionViewController: UIScrollViewDelegate {

}

// MARK: - UISearchBarDelegate
extension CollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchForCocktail(searchTerm: searchText)
    }
}
