import Foundation

protocol FavoriteCocktailViewProtocol: AnyObject {
    func realmIsEmpty()
    func realmNotEmpty()
    func sortCollectionView()
    func filterCollectionView()
}

protocol FavoriteCocktailViewPresenterProtocol: AnyObject {
    init(view: FavoriteCocktailViewProtocol, realmManager: RealmManagerProtocol?)
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

final class FavoriteCocktailViewPresenter: FavoriteCocktailViewPresenterProtocol {
    weak var view: FavoriteCocktailViewProtocol?
    var realmManager: RealmManagerProtocol?
    var cocktail: CocktailObject?
    var sortedCocktails: [CocktailObject]?
    var filteredCocktails: [CocktailObject]?

    required init(view: FavoriteCocktailViewProtocol, realmManager: RealmManagerProtocol?) {
        self.view = view
        self.realmManager = realmManager
    }
    
    public func checkIfThereAreAnyFavoritesCocktails() {
        guard let state = realmManager?.isThereAreAnyFavoriteCocktails(cocktail: cocktail) else { return }
        if state {
            self.view?.realmIsEmpty()
        } else {
            self.view?.realmNotEmpty()
        }
    }
    
    // MARK: - Sorting cocktails

    public func sortCocktails(sortType: SortType) {
        switch sortType {
        case .timeAdded:
            self.sortedCocktails = (realmManager?.sortCocktails(cocktail: cocktail, sortType: .timeAdded))!
        case .name:
            self.sortedCocktails = (realmManager?.sortCocktails(cocktail: cocktail, sortType: .name))!
        case .category:
            self.sortedCocktails = (realmManager?.sortCocktails(cocktail: cocktail, sortType: .category))!
        case .type:
            self.sortedCocktails = (realmManager?.sortCocktails(cocktail: cocktail, sortType: .type))!
        }
        
        self.view?.sortCollectionView()
    }
    
    public func configureSortedCollectionView(index: Int) -> CocktailObject? {
        return sortedCocktails?[index]
    }
    
    public func sortedCocktailsInRealmCount() -> Int {
        return sortedCocktails?.count ?? 0
    }
    
    public func fillSortedCocktails() {
        self.sortedCocktails = realmManager?.cocktailsInRealm()
    }
    
    // MARK: - Filtering cocktails
    
    public func filterCocktails(cocktailType: CocktailType) {
        switch cocktailType {
        case .all:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .all)
            
        case .ordinaryDrink:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .ordinaryDrink)
            
        case .beer:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .beer)
            
        case .cocktail:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .cocktail)
            
        case .coffeeTea:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .coffeeTea)
            
        case .shot:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .shot)
            
        case .punchPartyDrink:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .punchPartyDrink)
            
        case .softDrink:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .softDrink)
            
        case .otherUnknown:
            self.filteredCocktails = realmManager?.filterCocktails(cocktail: cocktail, cocktailType: .otherUnknown)
        }
        
        self.view?.filterCollectionView()
    }
    
    public func configureFilteredCollectionView(index: Int) -> CocktailObject? {
        return filteredCocktails?[index]
    }
    
    public func filteredCocktailsInRealmCount() -> Int {
        return filteredCocktails?.count ?? 0
    }
    
    public func fillFilteredCocktails() {
        self.filteredCocktails = realmManager?.cocktailsInRealm()
    }
}
