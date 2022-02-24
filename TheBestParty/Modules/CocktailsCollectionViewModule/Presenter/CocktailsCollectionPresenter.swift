import Foundation

protocol CocktailsCollectionViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol CocktailsCollectionViewPresenterProtocol: AnyObject {
    init(view: CocktailsCollectionViewProtocol, networkManager: NetworkProviderForCocktails, router: RouterProtocol)
    var cocktails: [CocktailObject]? { get set }
    func goToDetails(cocktail: CocktailObject?)
    func searchForCocktail(searchTerm: String)
    func refresh()
}

final class CocktailsCollectionViewPresenter: CocktailsCollectionViewPresenterProtocol {
    weak var view: CocktailsCollectionViewProtocol?
    let networkManager: NetworkProviderForCocktails?
    var router: RouterProtocol?
    var cocktails: [CocktailObject]?

    required init(view: CocktailsCollectionViewProtocol, networkManager: NetworkProviderForCocktails, router: RouterProtocol) {
        self.view = view
        self.networkManager = networkManager
        self.router = router
        
        getCocktails()
    }
    
    func getCocktails(searchTerm: String = "") {
        networkManager?.getCocktails(searchTerm: searchTerm) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let cocktails):
                self.cocktails = Array(cocktails.drinks)
                DispatchQueue.main.async {
                    self.view?.success()
                }
            case .failure(let error):
                self.view?.failure(error: error)
            }
        }
    }
    
    func goToDetails(cocktail: CocktailObject?) {
        router?.showDetails(cocktail: cocktail)
    }
    
    func searchForCocktail(searchTerm: String) {
        var timer: Timer?
        let trimmedText = searchTerm.trimmingCharacters(in: .whitespaces)
        if trimmedText != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { [weak self] _ in
                guard let self = self else { return }
                self.getCocktails(searchTerm: trimmedText)
            })
        }
    }
    
    func refresh() {
        getCocktails()
    }
}
