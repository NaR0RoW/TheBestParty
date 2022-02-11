import Foundation

protocol FavoriteCocktailViewProtocol: AnyObject {
    func realmIsEmpty()
    func realmNotEmpty()
}

protocol FavoriteCocktailViewPresenterProtocol: AnyObject {
    init(view: FavoriteCocktailViewProtocol, realmManager: RealmManagerProtocol?)
    func configureNumberOfItemsInSection() -> Int
    func configureCellForItemAt(index: Int) -> CocktailModel?
    func checkIfThereAreAnyFavoritesCocktails()
    var cocktail: CocktailModel? { get set }
//    func filterCocktails(searchType: SearchType)
}

final class FavoriteCocktailViewPresenter: FavoriteCocktailViewPresenterProtocol {
    weak var view: FavoriteCocktailViewProtocol?
    var realmManager: RealmManagerProtocol?
    var cocktail: CocktailModel?

    required init(view: FavoriteCocktailViewProtocol, realmManager: RealmManagerProtocol?) {
        self.view = view
        self.realmManager = realmManager
    }
    
    public func configureNumberOfItemsInSection() -> Int {
        realmManager?.configureNumberOfItemsInSection() ?? 0
    }
    
    public func configureCellForItemAt(index: Int) -> CocktailModel? {
        realmManager?.configureCellForItemAt(index: index)
    }
    
    public func checkIfThereAreAnyFavoritesCocktails() {
        guard let state = realmManager?.checkIfThereAreAnyFavoritesCocktails() else { return }
        if state {
            self.view?.realmIsEmpty()
        } else {
            self.view?.realmNotEmpty()
        }
    }
    
//    public func filterCocktails(searchType: SearchType) {
//        switch searchType {
//        case .timeAdded:
////            realmManager?.filterCocktails(cocktail: cocktail, searchType: searchType)
//            let a = realmManager?.searchIn(cocktail: cocktail, searchType: searchType)
//            print(a)
//        case .name:
////            realmManager?.filterCocktails(cocktail: cocktail, searchType: searchType)
//            let a = realmManager?.searchIn(cocktail: cocktail, searchType: searchType)
//            print(a)
//        case .type:
////            realmManager?.filterCocktails(cocktail: cocktail, searchType: searchType)
//            let a = realmManager?.searchIn(cocktail: cocktail, searchType: searchType)
//            print(a)
//        case .alcoholType:
////            realmManager?.filterCocktails(cocktail: cocktail, searchType: searchType)
//            let a = realmManager?.searchIn(cocktail: cocktail, searchType: searchType)
//            print(a)
//        }
//    }
}
