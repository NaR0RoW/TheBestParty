import Foundation

protocol FavoriteCocktailViewProtocol: AnyObject {
    func realmIsEmpty()
    func realmNotEmpty()
    func filterCollectionView()
}

protocol FavoriteCocktailViewPresenterProtocol: AnyObject {
    init(view: FavoriteCocktailViewProtocol, realmManager: RealmManagerProtocol?)
    func cocktailsInRealmCount() -> Int
    func checkIfThereAreAnyFavoritesCocktails()
    func filterCocktails(sortType: SortType)
    func configureCollectionView(index: Int) -> CocktailObject?
    func fillCocktails()
}

final class FavoriteCocktailViewPresenter: FavoriteCocktailViewPresenterProtocol {
    weak var view: FavoriteCocktailViewProtocol?
    var realmManager: RealmManagerProtocol?
    var cocktail: CocktailObject?
    var sortedCocktails: [CocktailObject]?

    required init(view: FavoriteCocktailViewProtocol, realmManager: RealmManagerProtocol?) {
        self.view = view
        self.realmManager = realmManager
    }
    
    public func cocktailsInRealmCount() -> Int {
        return sortedCocktails?.count ?? 0
    }
    
    public func checkIfThereAreAnyFavoritesCocktails() {
        guard let state = realmManager?.isThereAreAnyFavoriteCocktails(cocktail: cocktail) else { return }
        if state {
            self.view?.realmIsEmpty()
        } else {
            self.view?.realmNotEmpty()
        }
    }

    public func filterCocktails(sortType: SortType) {
        switch sortType {
        case .timeAdded:
            self.sortedCocktails = (realmManager?.filterCocktails(cocktail: cocktail, sortType: .timeAdded))!
        case .name:
            self.sortedCocktails = (realmManager?.filterCocktails(cocktail: cocktail, sortType: .name))!
        case .category:
            self.sortedCocktails = (realmManager?.filterCocktails(cocktail: cocktail, sortType: .category))!
        case .type:
            self.sortedCocktails = (realmManager?.filterCocktails(cocktail: cocktail, sortType: .type))!
        }
        
        self.view?.filterCollectionView()
    }
    
    public func configureCollectionView(index: Int) -> CocktailObject? {
        return sortedCocktails?[index]
    }
    
    public func fillCocktails() {
        self.sortedCocktails = realmManager?.cocktailsInRealm()
    }
}
