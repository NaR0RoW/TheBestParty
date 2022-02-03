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
}

final class FavoriteCocktailViewPresenter: FavoriteCocktailViewPresenterProtocol {
    weak var view: FavoriteCocktailViewProtocol?
    var realmManager: RealmManagerProtocol?

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
}
