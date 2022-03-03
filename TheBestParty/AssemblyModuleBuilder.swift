import UIKit

protocol AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController
    func createCocktailDetailsModule(cocktail: CocktailObject?, router: RouterProtocol) -> UIViewController
    func createRandomCocktailModule() -> UIViewController
    func createFavoriteCocktailModule() -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyModuleBuilderProtocol {
    func createCocktailsCollectionModule(router: RouterProtocol) -> UIViewController {
        let view = CollectionViewController()
        let networkManager = NetworkManager()
        let presenter = CollectionPresenter(view: view, networkManager: networkManager, router: router)
        view.presenter = presenter
        
        return view
    }
    
    func createCocktailDetailsModule(cocktail: CocktailObject?, router: RouterProtocol) -> UIViewController {
        let view = DetailsViewController()
        let dataSource = TableViewDataSource()
        let realmManager = RealmManager()
        let presenter = DetailsPresenter(
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
        let view = RandomViewController()
        let dataSource = TableViewDataSource()
        let networkManager = NetworkManager()
        let realmManager = RealmManager()
        let presenter = RandomPresenter(
            view: view,
            networkManager: networkManager,
            dataSource: dataSource,
            realmManager: realmManager
        )
        view.presenter = presenter

        return view
    }
    
    func createFavoriteCocktailModule() -> UIViewController {
        let view = FavoritesViewController()
        let realmManager = RealmManager()
        let presenter = FavoritesPresenter(view: view, realmManager: realmManager)
        view.presenter = presenter
        
        return view
    }
}
