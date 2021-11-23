import Foundation

protocol CocktailDetailsViewProtocol: AnyObject {
    func setupDetails(with cocktail: CocktailModel?)
}

protocol CocktailDetailsViewPresenterProtocol: AnyObject {
    init(view: CocktailDetailsViewProtocol, networkService: NetworkServiceProtocol, cocktail: CocktailModel?, router: RouterProtocol)
    func setCocktail()
//    func tap()
}

class CocktailDetailsViewPresenter: CocktailDetailsViewPresenterProtocol {
    weak var view: CocktailDetailsViewProtocol?
    var cocktail: CocktailModel?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol?
    
    required init(view: CocktailDetailsViewProtocol, networkService: NetworkServiceProtocol, cocktail: CocktailModel?, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.cocktail = cocktail
        self.router = router
    }
    
    public func setCocktail() {
        self.view?.setupDetails(with: cocktail)
    }
    
//    func tap() {
//        router?.popToRoot()
//    }
}
