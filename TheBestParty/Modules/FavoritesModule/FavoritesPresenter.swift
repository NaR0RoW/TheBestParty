import Foundation

protocol FavoritesViewProtocol: AnyObject {
    func realmIsEmpty()
    func realmNotEmpty()
    func filterCollectionView()
}

protocol FavoritesPresenterProtocol: AnyObject {
    init(view: FavoritesViewProtocol, realmManager: RealmManagerProtocol?, router: RouterProtocol)
    func checkIfThereAreAnyFavoritesCocktails()
    func goToDetails(cocktail: CocktailObject?)
    var cocktails: [CocktailObject]? { get set }
    func cocktailsInRealm()
    
    func filterCocktails(cocktailType: CocktailType)
    func configureFilteredCollectionView(index: Int) -> CocktailObject?
    func filteredCocktailsInRealmCount() -> Int
    func fillFilteredCocktails()
}

final class FavoritesPresenter: FavoritesPresenterProtocol {
    weak var view: FavoritesViewProtocol?
    var realmManager: RealmManagerProtocol?
    var cocktail: CocktailObject?
    var sortedCocktails: [CocktailObject]?
    var filteredCocktails: [CocktailObject]?
    var router: RouterProtocol?
    var cocktails: [CocktailObject]?

    required init(view: FavoritesViewProtocol, realmManager: RealmManagerProtocol?, router: RouterProtocol) {
        self.view = view
        self.realmManager = realmManager
        self.router = router
    }
    
    func checkIfThereAreAnyFavoritesCocktails() {
        guard let condition = realmManager?.isThereAreAnyFavoriteCocktails() else { return }
        
        if condition {
            view?.realmNotEmpty()
        } else {
            view?.realmIsEmpty()
        }
    }
    
    func goToDetails(cocktail: CocktailObject?) {
        router?.showDetails(cocktail: cocktail)
    }
    
    func cocktailsInRealm() {
        cocktails = realmManager?.cocktailsInRealm()
    }
    
    func filterCocktails(cocktailType: CocktailType) {
        switch cocktailType {
        case .all:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .all)
            
        case .ordinaryDrink:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .ordinaryDrink)
            
        case .beer:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .beer)
            
        case .cocktail:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .cocktail)
            
        case .coffeeTea:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .coffeeTea)
            
        case .shot:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .shot)
            
        case .punchPartyDrink:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .punchPartyDrink)
            
        case .softDrink:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .softDrink)
            
        case .homemadeLiqueur:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .homemadeLiqueur)
            
        case .otherUnknown:
            filteredCocktails = realmManager?.filterCocktails(cocktailType: .otherUnknown)
        }
        
        view?.filterCollectionView()
    }
    
    func configureFilteredCollectionView(index: Int) -> CocktailObject? {
        return filteredCocktails?[index]
    }
    
    func filteredCocktailsInRealmCount() -> Int {
        return filteredCocktails?.count ?? 0
    }
    
    func fillFilteredCocktails() {
        filteredCocktails = realmManager?.cocktailsInRealm()
    }
}
