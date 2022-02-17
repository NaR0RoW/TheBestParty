import Foundation

protocol RandomCocktailViewProtocol: AnyObject {
    func success(with cocktail: CocktailObject?, with dataSource: TableViewDataSourceProtocol?)
    func failure(error: Error)
    func highlightFavoriteCocktail()
}

protocol RandomCocktailViewPresenterProtocol: AnyObject {
    init(
        view: RandomCocktailViewProtocol, 
        networkService: NetworkProviderForRandomCocktail, 
        dataSource: TableViewDataSourceProtocol, 
        realmManager: RealmManagerProtocol?
    )
    func refresh()
    func addToFavorite()
    func highlightFavoriteCocktail()
}

final class RandomCocktailViewPresenter: RandomCocktailViewPresenterProtocol {
    weak var view: RandomCocktailViewProtocol?
    let networkService: NetworkProviderForRandomCocktail?
    var dataSource: TableViewDataSourceProtocol?
    var cocktail: CocktailObject?
    var realmManager: RealmManagerProtocol?
    
    required init(
        view: RandomCocktailViewProtocol, 
        networkService: NetworkProviderForRandomCocktail,
        dataSource: TableViewDataSourceProtocol, 
        realmManager: RealmManagerProtocol?
    ) {
        self.view = view
        self.networkService = networkService
        self.dataSource = dataSource
        self.realmManager = realmManager
        
        getRandomCocktail()
    }
    
    public func getRandomCocktail() {
        networkService?.getRandomCocktail { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let cocktails):
                    self.cocktail = Array(cocktails.drinks).first
                    self.view?.success(with: Array(cocktails.drinks).first, with: self.dataSource)
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    public func refresh() {
        getRandomCocktail()
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
