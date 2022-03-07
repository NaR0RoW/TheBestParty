import UIKit
import Lottie

final class FavoritesViewController: UIViewController {
    var presenter: FavoritesPresenterProtocol?
    
    lazy var cocktailsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.width / 2 - 15.0, height: view.width / 2 - 15.0)
        layout.sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.registerCell(CollectionViewCell.self)
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
        presenter?.cocktailsInRealm()
        presenter?.fillFilteredCocktails()
    }
}

extension FavoritesViewController {
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
    
    private func setupMenu() {
        let handler: (_ action: UIAction) -> Void = { action in
            switch action.identifier.rawValue {
            case "All":
                self.presenter?.filterCocktails(cocktailType: .all)
                
            case "Ordinary drink":
                self.presenter?.filterCocktails(cocktailType: .ordinaryDrink)
                
            case "Beer":
                self.presenter?.filterCocktails(cocktailType: .beer)
                
            case "Cocktail":
                self.presenter?.filterCocktails(cocktailType: .cocktail)
                
            case "Coffee/Tea":
                self.presenter?.filterCocktails(cocktailType: .coffeeTea)
                
            case "Shot":
                self.presenter?.filterCocktails(cocktailType: .shot)
                
            case "Punch/Party Drink":
                self.presenter?.filterCocktails(cocktailType: .punchPartyDrink)
                
            case "Soft Drink":
                self.presenter?.filterCocktails(cocktailType: .softDrink)
                
            case "Other/Unknown":
                self.presenter?.filterCocktails(cocktailType: .otherUnknown)
                
            default:
                break
            }
        }
        
        let menuActions = [
            UIAction(title: "All", identifier: UIAction.Identifier("All"), handler: handler),
            UIAction(title: "Ordinary drink", identifier: UIAction.Identifier("Ordinary drink"), handler: handler),
            UIAction(title: "Beer", identifier: UIAction.Identifier("Beer"), handler: handler),
            UIAction(title: "Cocktail", identifier: UIAction.Identifier("Cocktail"), handler: handler),
            UIAction(title: "Coffee/Tea", identifier: UIAction.Identifier("Coffee/Tea"), handler: handler),
            UIAction(title: "Shot", identifier: UIAction.Identifier("Shot"), handler: handler),
            UIAction(title: "Punch/Party Drink", identifier: UIAction.Identifier("Punch/Party Drink"), handler: handler),
            UIAction(title: "Soft Drink", identifier: UIAction.Identifier("Soft Drink"), handler: handler),
            UIAction(title: "Other/Unknown", identifier: UIAction.Identifier("Other/Unknown"), handler: handler)
        ]
        
        let menu = UIMenu(children: menuActions)
        
        let rightBarButton = UIBarButtonItem(title: "Filter", menu: menu)
        rightBarButton.tintColor = .label
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.filteredCocktailsInRealmCount() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as CollectionViewCell
        cell.configureCell(with: (presenter?.configureFilteredCollectionView(index: indexPath.row))!)
        
        return cell
    }
}

extension FavoritesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cocktail = presenter?.cocktails?[indexPath.row]
        presenter?.goToDetails(cocktail: cocktail)
    }
}

extension FavoritesViewController: FavoritesViewProtocol {
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
