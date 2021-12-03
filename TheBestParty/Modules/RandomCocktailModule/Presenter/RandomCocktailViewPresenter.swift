import Foundation

protocol RandomCocktailViewProtocol: AnyObject {
    func success(with cocktail: CocktailModel?, with dataSource: TableViewDataSourceProtocol?)
    func failure(error: Error)
}

protocol RandomCocktailViewPresenterProtocol: AnyObject {
    init(view: RandomCocktailViewProtocol, networkService: NetworkProviderForRandomCocktail, dataSource: TableViewDataSourceProtocol)
    func refresh()
    func addToFavorite()
}

final class RandomCocktailViewPresenter: RandomCocktailViewPresenterProtocol {
    weak var view: RandomCocktailViewProtocol?
    let networkService: NetworkProviderForRandomCocktail?
    var dataSource: TableViewDataSourceProtocol?
    var cocktail: CocktailModel?
    
    required init(view: RandomCocktailViewProtocol, networkService: NetworkProviderForRandomCocktail, dataSource: TableViewDataSourceProtocol) {
        self.view = view
        self.networkService = networkService
        self.dataSource = dataSource
        
        getRandomCocktail()
    }
    
    public func getRandomCocktail() {
        networkService?.getRandomCocktail { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let cocktails):
                    self.cocktail = cocktails
                    self.view?.success(with: cocktails, with: self.dataSource)
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
        print("Added to favorite")
    }
}
