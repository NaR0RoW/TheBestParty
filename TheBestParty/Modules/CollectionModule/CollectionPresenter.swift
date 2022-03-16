import Foundation

protocol CollectionViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol CollectionPresenterProtocol: AnyObject {
    init(view: CollectionViewProtocol, networkManager: NetworkProviderForCocktails, router: RouterProtocol)
    var cocktails: [CocktailObject]? { get set }
    func goToDetails(cocktail: CocktailObject?)
    func getCocktails(searchTerm: String) 
}

final class CollectionPresenter: CollectionPresenterProtocol {
    weak var view: CollectionViewProtocol?
    let networkManager: NetworkProviderForCocktails?
    var router: RouterProtocol?
    var cocktails: [CocktailObject]?

    required init(view: CollectionViewProtocol, networkManager: NetworkProviderForCocktails, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
        
        getCocktails()
    }
    
    func getCocktails(searchTerm: String = "") {
        networkManager?.getCocktails(searchTerm: searchTerm) { [weak self] result in
            guard let newSelf = self else { return }
            switch result {
            case .success(let cocktails):
                DispatchQueue.main.async {
                    newSelf.cocktails = Array(cocktails.drinks)
                    newSelf.view?.success()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    newSelf.view?.failure(error: error)
                }
            }
        }
    }
    
    func goToDetails(cocktail: CocktailObject?) {
        router?.showDetails(cocktail: cocktail)
    }
}
