import UIKit

protocol AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController
    func createCocktailDetailsModule(cocktail: CocktailModel?, router: RouterProtocol) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    public func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController {
        let view = CocktailsCollectionViewController()
        let networkService = NetworkService()
        let presenter = CocktailsCollectionViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
    
    public func createCocktailDetailsModule(cocktail: CocktailModel?, router: RouterProtocol) -> UIViewController {
        let view = CocktailDetailsViewController()
        let dataSource = TableViewDataSource()
        let presenter = CocktailDetailsViewPresenter(view: view, cocktail: cocktail, router: router, dataSource: dataSource)
        view.presenter = presenter

        return view
    }
}
