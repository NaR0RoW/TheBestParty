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
        if let newNavigationController = navigationController {
            switch viewController {
            case .collection:
                guard let collectionViewController = assemblyModuleBuilder?.createCocktailsCollectionModule(router: self) else { return }
                newNavigationController.viewControllers = [collectionViewController]
            case .favorites:
                guard let favoritesViewController = assemblyModuleBuilder?.createFavoriteCocktailModule(router: self) else { return }
                newNavigationController.viewControllers = [favoritesViewController]
            }
        }
    }

    func showDetails(cocktail: CocktailObject?) {
        if let newNavigationController = navigationController {
            guard let cocktailDetailsViewController = assemblyModuleBuilder?.createCocktailDetailsModule(
                cocktail: cocktail,
                router: self
            ) else { return }
            newNavigationController.pushViewController(cocktailDetailsViewController, animated: true)
        }
    }
    
    func popViewController() {
        if let newNavigationController = navigationController {
            newNavigationController.popViewController(animated: true)
        }
    }
}
