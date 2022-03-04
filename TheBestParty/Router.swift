import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController(for viewController: ForViewController)
    func showDetails(cocktail: CocktailObject?)
    func popViewController()
}

enum ForViewController {
    case collection
    case favorites
}

final class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyModuleBuilder = assemblyBuilder
    }
    
    func initialViewController(for viewController: ForViewController) {
        if let navigationController = navigationController {
            switch viewController {
            case .collection:
                guard let collectionViewController = assemblyModuleBuilder?.createCocktailsCollectionModule(router: self) else { return }
                navigationController.viewControllers = [collectionViewController]
            case .favorites:
                guard let favoritesViewController = assemblyModuleBuilder?.createFavoriteCocktailModule(router: self) else { return }
                navigationController.viewControllers = [favoritesViewController]
            }
        }
    }

    func showDetails(cocktail: CocktailObject?) {
        if let navigationController = navigationController {
            guard let cocktailDetailsViewController = assemblyModuleBuilder?.createCocktailDetailsModule(
                cocktail: cocktail,
                router: self
            ) else { return }
            navigationController.pushViewController(cocktailDetailsViewController, animated: true)
        }
    }
    
    func popViewController() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
}
