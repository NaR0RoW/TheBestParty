import Foundation

protocol FavoritesViewProtocol: AnyObject {
    func realmIsEmpty()
    func realmNotEmpty()
    func sortCollectionView()
    func filterCollectionView()
}

protocol FavoritesPresenterProtocol: AnyObject {
    init(view: FavoritesViewProtocol, realmManager: RealmManagerProtocol?)
    func checkIfThereAreAnyFavoritesCocktails()
    
    func sortCocktails(sortType: SortType)
    func configureSortedCollectionView(index: Int) -> CocktailObject?
    func sortedCocktailsInRealmCount() -> Int
    func fillSortedCocktails()
    
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

    required init(view: FavoritesViewProtocol, realmManager: RealmManagerProtocol?) {
        self.view = view
        self.realmManager = realmManager
    }
    
    func checkIfThereAreAnyFavoritesCocktails() {
        guard let condition = realmManager?.isThereAreAnyFavoriteCocktails() else { return }
        
        if condition {
            self.view?.realmNotEmpty()
        } else {
            self.view?.realmIsEmpty()
        }
    }
    
    // MARK: - Sorting cocktails

    func sortCocktails(sortType: SortType) {
        switch sortType {
        case .timeAdded:
            self.sortedCocktails = (realmManager?.sortCocktails(sortType: .timeAdded))!
        case .name:
            self.sortedCocktails = (realmManager?.sortCocktails(sortType: .name))!
        case .category:
            self.sortedCocktails = (realmManager?.sortCocktails(sortType: .category))!
        case .type:
            self.sortedCocktails = (realmManager?.sortCocktails(sortType: .type))!
        }
        
        self.view?.sortCollectionView()
    }
    
    func configureSortedCollectionView(index: Int) -> CocktailObject? {
        return sortedCocktails?[index]
    }
    
    func sortedCocktailsInRealmCount() -> Int {
        return sortedCocktails?.count ?? 0
    }
    
    func fillSortedCocktails() {
        self.sortedCocktails = realmManager?.cocktailsInRealm()
    }
    
    // MARK: - Filtering cocktails
    
    func filterCocktails(cocktailType: CocktailType) {
        switch cocktailType {
        case .all:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .all)
            
        case .ordinaryDrink:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .ordinaryDrink)
            
        case .beer:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .beer)
            
        case .cocktail:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .cocktail)
            
        case .coffeeTea:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .coffeeTea)
            
        case .shot:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .shot)
            
        case .punchPartyDrink:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .punchPartyDrink)
            
        case .softDrink:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .softDrink)
            
        case .otherUnknown:
            self.filteredCocktails = realmManager?.filterCocktails(cocktailType: .otherUnknown)
        }
        
        self.view?.filterCollectionView()
    }
    
    func configureFilteredCollectionView(index: Int) -> CocktailObject? {
        return filteredCocktails?[index]
    }
    
    func filteredCocktailsInRealmCount() -> Int {
        return filteredCocktails?.count ?? 0
    }
    
    func fillFilteredCocktails() {
        self.filteredCocktails = realmManager?.cocktailsInRealm()
    }
}
