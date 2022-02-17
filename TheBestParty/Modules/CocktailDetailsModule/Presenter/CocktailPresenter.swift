import Foundation

protocol CocktailDetailsViewProtocol: AnyObject {
    func setupDetails(with cocktail: CocktailObject?, with dataSource: TableViewDataSourceProtocol?)
    func highlightFavoriteCocktail()
}

protocol CocktailDetailsViewPresenterProtocol: AnyObject {
    init(
        view: CocktailDetailsViewProtocol,
        cocktail: CocktailObject?,
        router: RouterProtocol,
        dataSource: TableViewDataSourceProtocol,
        realmManager: RealmManagerProtocol?
    )
    func setupDetails()
    func popToRoot()
    func addToFavorite()
    func highlightFavoriteCocktail()
}

final class CocktailDetailsViewPresenter: CocktailDetailsViewPresenterProtocol {
    weak var view: CocktailDetailsViewProtocol?
    var cocktail: CocktailObject?
    var router: RouterProtocol?
    var dataSource: TableViewDataSourceProtocol?
    var realmManager: RealmManagerProtocol?
    
    required init(
        view: CocktailDetailsViewProtocol,
        cocktail: CocktailObject?,
        router: RouterProtocol,
        dataSource: TableViewDataSourceProtocol,
        realmManager: RealmManagerProtocol?
    ) {
        self.view = view
        self.cocktail = cocktail
        self.router = router
        self.dataSource = dataSource
        self.realmManager = realmManager
    }
    
    public func setupDetails() {
        self.view?.setupDetails(with: cocktail, with: dataSource)
    }
    
    public func popToRoot() {
        router?.popToRoot()
    }
    
    public func addToFavorite() {
        realmManager?.tapToFavorite(cocktail: self.cocktail)
    }
    
    public func highlightFavoriteCocktail() {
        if realmManager?.isCocktailInRealm(cocktail: self.cocktail) == true {
            self.view?.highlightFavoriteCocktail()
        } 
    }
}
