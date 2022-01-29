import UIKit

final class FavoritesCocktailsViewController: UIViewController {
    var presenter: FavoriteCocktailViewPresenterProtocol?
    
    lazy var cocktailsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.width / 2 - 15.0, height: view.width / 2 - 15.0)
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerCell(CocktailCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cocktailsCollectionView.reloadData()
    }
}

extension FavoritesCocktailsViewController {
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(cocktailsCollectionView)
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
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
}

extension FavoritesCocktailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.configureNumberOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CocktailCollectionViewCell
        cell.configureCell(with: (presenter?.configureCellForItemAt(index: indexPath.row))!)
        
        return cell
    }
}

extension FavoritesCocktailsViewController: UICollectionViewDelegate {
    
}

extension FavoritesCocktailsViewController: FavoriteCocktailViewProtocol {
    
}
