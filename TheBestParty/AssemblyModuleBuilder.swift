import UIKit

protocol AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController
    func createCocktailDetailsModule(cocktail: CocktailObject?, router: RouterProtocol) -> UIViewController
    func createRandomCocktailModule() -> UIViewController
    func createFavoriteCocktailModule() -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    public func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController {
        let view = CocktailsCollectionViewController()
        let networkService = NetworkService()
        let presenter = CocktailsCollectionViewPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        
        return view
    }
    
    public func createCocktailDetailsModule(cocktail: CocktailObject?, router: RouterProtocol) -> UIViewController {
        let view = CocktailDetailsViewController()
        let dataSource = TableViewDataSource()
        let realmManager = RealmManager()
        let presenter = CocktailDetailsViewPresenter(
            view: view,
            cocktail: cocktail,
            router: router,
            dataSource: dataSource,
            realmManager: realmManager
        )
        view.presenter = presenter

        return view
    }
    
    public func createRandomCocktailModule() -> UIViewController {
        let view = RandomCocktailViewController()
        let dataSource = TableViewDataSource()
        let networkService = NetworkService()
        let realmManager = RealmManager()
        let presenter = RandomCocktailViewPresenter(
            view: view,
            networkService: networkService,
            dataSource: dataSource,
            realmManager: realmManager
        )
        view.presenter = presenter

        return view
    }
    
    public func createFavoriteCocktailModule() -> UIViewController {
        let view = FavoritesCocktailsViewController()
        let realmManager = RealmManager()
        let presenter = FavoriteCocktailViewPresenter(view: view, realmManager: realmManager)
        view.presenter = presenter
        
        return view
    }
}
