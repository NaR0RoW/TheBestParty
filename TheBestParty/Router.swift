import UIKit

protocol RouterMainProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func initialViewController()
//    func showDetail(cocktail: CocktailModel?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyModuleBuilder: AssemblyModuleBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyModuleBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyModuleBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let cocktailViewController = assemblyModuleBuilder?.createCocktailsCollectionModule(router: self) else { return }
            navigationController.viewControllers = [cocktailViewController]
        }
    }
//
//    func showDetail(cocktail: CocktailModel?) {
//        if let navigationController = navigationController {
//            guard let cocktailViewController = assemblyModuleBuilder?.createCocktailModule(cocktail: cocktail, router: self) else { return }
//            navigationController.pushViewController(cocktailViewController, animated: true)
//        }
//    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
