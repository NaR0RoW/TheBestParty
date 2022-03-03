import Foundation

protocol RandomViewProtocol: AnyObject {
    func success(with dataSource: TableViewDataSourceProtocol?)
    func failure(error: Error)
    func highlightFavoriteCocktail()
}

protocol RandomPresenterProtocol: AnyObject {
    init(
        view: RandomViewProtocol, 
        networkManager: NetworkProviderForRandomCocktail, 
        dataSource: TableViewDataSourceProtocol, 
        realmManager: RealmManagerProtocol?
    )
    func refresh()
    func addToFavorite()
    func highlightFavoriteCocktail()
    var cocktail: CocktailObject? { get set }
}

final class RandomPresenter: RandomPresenterProtocol {
    weak var view: RandomViewProtocol?
    let networkManager: NetworkProviderForRandomCocktail?
    var dataSource: TableViewDataSourceProtocol?
    var cocktail: CocktailObject?
    var realmManager: RealmManagerProtocol?
    
    required init(
        view: RandomViewProtocol, 
        networkManager: NetworkProviderForRandomCocktail,
        dataSource: TableViewDataSourceProtocol, 
        realmManager: RealmManagerProtocol?
    ) {
        self.view = view
        self.networkManager = networkManager
        self.dataSource = dataSource
        self.realmManager = realmManager
        
        getRandomCocktail()
    }
    
    func getRandomCocktail() {
        networkManager?.getRandomCocktail { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let cocktails):
                    self.cocktail = Array(cocktails.drinks).first
                    self.view?.success(with: self.dataSource)
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func refresh() {
        getRandomCocktail()
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
