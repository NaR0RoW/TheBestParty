import Foundation

protocol CocktailsCollectionViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
}

protocol CocktailsCollectionViewPresenterProtocol: AnyObject {
    init(view: CocktailsCollectionViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var cocktails: [CocktailModel]? { get set }
    func getCocktails()
    func goToDetails(cocktail: CocktailModel?)
}

class CocktailsCollectionViewPresenter: CocktailsCollectionViewPresenterProtocol {
    weak var view: CocktailsCollectionViewProtocol?
    var cocktails: [CocktailModel]?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol?
    
    required init(view: CocktailsCollectionViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        
        getCocktails()
    }
    
    func getCocktails() { // Thread 1
        networkService?.getCocktails() { [weak self] result in // Thread 3
            guard let self = self else { return } // Thread 3
            DispatchQueue.main.async { // Thread 3
                switch result { // Thread 1
                case .success(let cocktails):
                    self.cocktails = cocktails.drinks.compactMap {
                        CocktailModel(drinks: [Cocktail(
                            cocktailName: $0.cocktailName,
                            cocktailCategory: $0.cocktailCategory,
                            cocktailGlass: $0.cocktailGlass,
                            cocktailInstructions: $0.cocktailInstructions,
                            cocktailImage: $0.cocktailImage,
                            cocktailType: $0.cocktailType,
                            cocktailFirstIngredient: $0.cocktailFirstIngredient,
                            cocktailSecondIngredient: $0.cocktailSecondIngredient,
                            cocktailThirdIngredient: $0.cocktailThirdIngredient,
                            cocktailFourthIngredient: $0.cocktailFourthIngredient,
                            cocktailFirstIngredientMeasure: $0.cocktailFirstIngredientMeasure,
                            cocktailSecondIngredientMeasure: $0.cocktailSecondIngredientMeasure,
                            cocktailThirdIngredientMeasure: $0.cocktailThirdIngredientMeasure,
                            cocktailFourthIngredientMeasure: $0.cocktailFourthIngredientMeasure
                        )])
                    }
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func goToDetails(cocktail: CocktailModel?) {
        router?.showDetails(cocktail: cocktail)
    }
}
