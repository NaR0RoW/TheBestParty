import UIKit

protocol AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController
    func createCocktailDetailsModule(cocktail: CocktailObject?, router: RouterProtocol) -> UIViewController
    func createRandomCocktailModule() -> UIViewController
    func createFavoriteCocktailModule() -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController {
        let view = CocktailsCollectionViewController()
        let networkManager = NetworkManager()
        let presenter = CocktailsCollectionViewPresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createCocktailDetailsModule(cocktail: CocktailObject?, router: RouterProtocol) -> UIViewController {
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
    
    func createRandomCocktailModule() -> UIViewController {
        let view = RandomCocktailViewController()
        let dataSource = TableViewDataSource()
        let networkManager = NetworkManager()
        let realmManager = RealmManager()
        let presenter = RandomCocktailViewPresenter(
            view: view,
            networkManager: networkManager,
            dataSource: dataSource,
            realmManager: realmManager
        )
        view.presenter = presenter

        return view
    }
    
    func createFavoriteCocktailModule() -> UIViewController {
        let view = FavoritesCocktailsViewController()
        let realmManager = RealmManager()
        let presenter = FavoriteCocktailViewPresenter(view: view, realmManager: realmManager)
        view.presenter = presenter
        
        return view
    }
}
