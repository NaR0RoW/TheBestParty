import UIKit
import Lottie

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
    
    private let noResultsView: UIView = {
        let view = UIView()
        view.alpha = 0.0
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var lottieView: AnimationView = {
        let lottieView = AnimationView(name: "favouriteIcon")
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 0.5
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
        return lottieView
    }()
    
    private let noResultsHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30.0, weight: .bold)
        label.text = "Your favorites are empty"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let noResultsSubLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22.0, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Add some cocktails to your favorites to have them at hand"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        setupNoResultsView()
        setupMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.checkIfThereAreAnyFavoritesCocktails()
        presenter?.fillCocktails()
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
    
    private func setupNoResultsView() {
        view.addSubview(noResultsView)
        NSLayoutConstraint.activate([
            noResultsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25.0),
            noResultsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15.0),
            noResultsView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15.0),
            noResultsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15.0)
        ])
        
        noResultsView.addSubview(lottieView)
        NSLayoutConstraint.activate([
            lottieView.topAnchor.constraint(equalTo: noResultsView.topAnchor),
            lottieView.centerXAnchor.constraint(equalTo: noResultsView.centerXAnchor),
            lottieView.widthAnchor.constraint(equalTo: noResultsView.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: noResultsView.widthAnchor)
        ])
        
        noResultsView.addSubview(noResultsHeaderLabel)
        NSLayoutConstraint.activate([
            noResultsHeaderLabel.topAnchor.constraint(equalTo: lottieView.bottomAnchor, constant: 25.0),
            noResultsHeaderLabel.centerXAnchor.constraint(equalTo: noResultsView.centerXAnchor)
        ])
        
        noResultsView.addSubview(noResultsSubLabel)
        NSLayoutConstraint.activate([
            noResultsSubLabel.topAnchor.constraint(equalTo: noResultsHeaderLabel.bottomAnchor, constant: 25.0),
            noResultsSubLabel.leftAnchor.constraint(equalTo: noResultsView.leftAnchor, constant: 15.0),
            noResultsSubLabel.rightAnchor.constraint(equalTo: noResultsView.rightAnchor, constant: -15.0)
        ])
    }
    
    // TODO: - Think for a better declaration
    private func setupMenu() {
        let handler: (_ action: UIAction) -> () = { action in
            switch action.identifier.rawValue {
            case "Time added":
                self.presenter?.filterCocktails(sortType: .timeAdded)
                
            case "Name":
                self.presenter?.filterCocktails(sortType: .name)
                
            case "Category":
                self.presenter?.filterCocktails(sortType: .category)
                
            case "Type":
                self.presenter?.filterCocktails(sortType: .type)
                
            default:
                break
            }
        }
        
        let menuActions = [
            UIAction(title: "Time added", identifier: UIAction.Identifier("Time added"), handler: handler),
            UIAction(title: "Name", identifier: UIAction.Identifier("Name"), handler: handler),
            UIAction(title: "Category", identifier: UIAction.Identifier("Category"), handler: handler),
            UIAction(title: "Type", identifier: UIAction.Identifier("Type"), handler: handler)
        ]
        
        let menu = UIMenu(children: menuActions)
        
        let rightBarButton = UIBarButtonItem(title: "Sort", menu: menu)
        rightBarButton.tintColor = .label
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

extension FavoritesCocktailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.cocktailsInRealmCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CocktailCollectionViewCell
        cell.configureCell(with: (presenter?.configureCollectionView(index: indexPath.row))!)
        
        return cell
    }
}

extension FavoritesCocktailsViewController: UICollectionViewDelegate {
    
}

extension FavoritesCocktailsViewController: FavoriteCocktailViewProtocol {
    // TODO: - Think for a better solution
    func realmIsEmpty() {
        cocktailsCollectionView.alpha = 0.0
        cocktailsCollectionView.reloadData()
        noResultsView.alpha = 1.0
        lottieView.play()
    }
    
    func realmNotEmpty() {
        noResultsView.alpha = 0.0
        cocktailsCollectionView.alpha = 1.0
        cocktailsCollectionView.reloadData()
    }
    
    func filterCollectionView() {
        cocktailsCollectionView.reloadData()
    }
}
