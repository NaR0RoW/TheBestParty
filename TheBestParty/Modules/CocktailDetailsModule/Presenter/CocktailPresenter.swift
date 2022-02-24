import Foundation

protocol CocktailDetailsViewProtocol: AnyObject {
    func setupDetails(with dataSource: TableViewDataSourceProtocol?)
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
    func popViewController()
    func addToFavorite()
    func highlightFavoriteCocktail()
    var cocktail: CocktailObject? { get set }
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
    
    func setupDetails() {
        self.view?.setupDetails(with: dataSource)
    }
    
    func popViewController() {
        router?.popViewController()
    }
    
    func addToFavorite() {
        realmManager?.tapToFavorite(cocktail: self.cocktail)
    }
    
    func highlightFavoriteCocktail() {
        if realmManager?.isCocktailInRealm(cocktail: self.cocktail) == true {
            self.view?.highlightFavoriteCocktail()
        } 
    }
}
