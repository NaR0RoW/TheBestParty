import Foundation

protocol CocktailsCollectionViewProtocol: AnyObject {
    func success()
    func failure(error: Error)
//    func presentAlert()
//    func dismissAlert()
}

protocol CocktailsCollectionViewPresenterProtocol: AnyObject {
    init(view: CocktailsCollectionViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    var cocktails: [CocktailModel]? { get set }
    func getCocktails(searchTerm: String)
    func goToDetails(cocktail: CocktailModel?)
    func searchForCocktail(searchTerm: String)
}

final class CocktailsCollectionViewPresenter: CocktailsCollectionViewPresenterProtocol {
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
    
    public func getCocktails(searchTerm: String = "") { // Thread 1
        networkService?.getCocktails(searchTerm: searchTerm) { [weak self] result in // Thread 3
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
                            cocktailFifthIngredient: $0.cocktailFifthIngredient,
                            cocktailSixthIngredient: $0.cocktailSixthIngredient,
                            cocktailSeventhIngredient: $0.cocktailSeventhIngredient,
                            cocktailEighthIngredient: $0.cocktailEighthIngredient,
                            cocktailNinthIngredient: $0.cocktailNinthIngredient,
                            cocktailTenthIngredient: $0.cocktailTenthIngredient,
                            cocktailEleventhIngredient: $0.cocktailEleventhIngredient,
                            cocktailTwelfthIngredient: $0.cocktailTwelfthIngredient,
                            cocktailThirteenthIngredient: $0.cocktailThirteenthIngredient,
                            cocktailFourteenthIngredient: $0.cocktailFourteenthIngredient,
                            cocktailFifteenthIngredient: $0.cocktailFifteenthIngredient,
                            cocktailFirstIngredientMeasure: $0.cocktailFirstIngredientMeasure,
                            cocktailSecondIngredientMeasure: $0.cocktailSecondIngredientMeasure,
                            cocktailThirdIngredientMeasure: $0.cocktailThirdIngredientMeasure,
                            cocktailFourthIngredientMeasure: $0.cocktailFourthIngredientMeasure,
                            cocktailFifthIngredientMeasure: $0.cocktailFifthIngredientMeasure,
                            cocktailSixthIngredientMeasure: $0.cocktailSixthIngredientMeasure,
                            cocktailSeventhIngredientMeasure: $0.cocktailSeventhIngredientMeasure,
                            cocktailEighthIngredientMeasure: $0.cocktailEighthIngredientMeasure,
                            cocktailNinthIngredientMeasure: $0.cocktailNinthIngredientMeasure,
                            cocktailTenthIngredientMeasure: $0.cocktailTenthIngredientMeasure,
                            cocktailEleventhIngredientMeasure: $0.cocktailEleventhIngredientMeasure,
                            cocktailTwelfthIngredientMeasure: $0.cocktailTwelfthIngredientMeasure,
                            cocktailThirteenthIngredientMeasure: $0.cocktailThirteenthIngredientMeasure,
                            cocktailFourteenthIngredientMeasure: $0.cocktailFourteenthIngredientMeasure,
                            cocktailFifteenthIngredientMeasure: $0.cocktailFifteenthIngredientMeasure
                        )])
                    }
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    public func goToDetails(cocktail: CocktailModel?) {
        router?.showDetails(cocktail: cocktail)
    }
    
    public func searchForCocktail(searchTerm: String) {
        var timer: Timer?
        let text = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        if text != "" {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
                guard let self = self else { return }
//                self.view?.presentAlert()
                self.getCocktails(searchTerm: searchTerm)
//                DispatchQueue.main.async {
//                    self.view?.dismissAlert()
//                }
            })
        }
    }
}
