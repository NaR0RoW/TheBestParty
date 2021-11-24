import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
    func showDetails(cocktail: CocktailModel?)
    func popToRoot()
}

final class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyModuleBuilder = assemblyBuilder
    }
    
    public func initialViewController() {
        if let navigationController = navigationController {
            guard let cocktailsCollectionViewController = assemblyModuleBuilder?.createCocktailsCollectionModule(router: self) else { return }
            navigationController.viewControllers = [cocktailsCollectionViewController]
        }
    }

    public func showDetails(cocktail: CocktailModel?) {
        if let navigationController = navigationController {
            guard let cocktailDetailsViewController = assemblyModuleBuilder?.createCocktailDetailsModule(cocktail: cocktail, router: self) else { return }
            navigationController.pushViewController(cocktailDetailsViewController, animated: true)
        }
    }
    
    public func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
