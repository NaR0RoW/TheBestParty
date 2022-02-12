import Foundation

protocol CocktailsCollectionViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol CocktailsCollectionViewPresenterProtocol: AnyObject {
    init(view: CocktailsCollectionViewProtocol, networkService: NetworkProviderForCocktails, router: RouterProtocol)
    var cocktails: [CocktailObject]? { get set }
    func goToDetails(cocktail: CocktailObject?)
    func searchForCocktail(searchTerm: String)
    func refresh()
}

final class CocktailsCollectionViewPresenter: CocktailsCollectionViewPresenterProtocol {
    weak var view: CocktailsCollectionViewProtocol?
    let networkService: NetworkProviderForCocktails?
    var router: RouterProtocol?
    var cocktails: [CocktailObject]?

    required init(view: CocktailsCollectionViewProtocol, networkService: NetworkProviderForCocktails, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        
        getCocktails()
    }
    
    public func getCocktails(searchTerm: String = "") { 
        networkService?.getCocktails(searchTerm: searchTerm) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let cocktails):
                    self.cocktails = Array(cocktails.drinks)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.view?.success()
                    }
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    public func goToDetails(cocktail: CocktailObject?) {
        router?.showDetails(cocktail: cocktail)
    }
    
    public func searchForCocktail(searchTerm: String) {
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
    
    public func refresh() {
        getCocktails()
    }
}
