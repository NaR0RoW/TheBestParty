import UIKit

protocol AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController
    func createCocktailModule(cocktail: CocktailModel?, router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController {
        let view = CocktailsCollectionViewController()
        let networkService = NetworkService()
        let presenter = CocktailsCollectionViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createCocktailModule(cocktail: CocktailModel?, router: RouterProtocol) -> UIViewController {
        let view = CocktailDetailsViewController()
        let networkService = NetworkService()
        let presenter = CocktailDetailsViewPresenter(view: view, networkService: networkService, cocktail: cocktail, router: router)
        view.presenter = presenter
        
        return view
    }
}
