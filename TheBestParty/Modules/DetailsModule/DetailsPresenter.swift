import Foundation

protocol DetailsViewProtocol: AnyObject {
    func setupDetails(with dataSource: TableViewDataSourceProtocol?)
    func highlightFavoriteCocktail()
    func discardViewController()
}

protocol DetailsPresenterProtocol: AnyObject {
    init(
        view: DetailsViewProtocol,
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

final class DetailsPresenter: DetailsPresenterProtocol {
    weak var view: DetailsViewProtocol?
    var cocktail: CocktailObject?
    var router: RouterProtocol?
    var dataSource: TableViewDataSourceProtocol?
    var realmManager: RealmManagerProtocol?
    
    required init(
        view: DetailsViewProtocol,
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
        self.router?.popViewController()
    }
    
    func addToFavorite() {
        self.realmManager?.tapToFavorite(cocktail: self.cocktail)
        guard let needToPop = realmManager?.isItNecessaryToPopViewController else { return }
        if needToPop {
            self.view?.discardViewController()
        }
    }
    
    func highlightFavoriteCocktail() {
        if realmManager?.isCocktailInRealm(cocktail: self.cocktail) == true {
            self.view?.highlightFavoriteCocktail()
        } 
    }
}
