import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let assemblyBuilder = AssemblyModuleBuilder()
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        router.initialViewController()

        let submodules = (
            cocktails: navigationController,
            favoritesCocktails: UINavigationController(rootViewController: assemblyBuilder.createFavoriteCocktailModule()),
            ingredients: UINavigationController(rootViewController: IngredientsViewController()),
            randomCocktail: UINavigationController(rootViewController: assemblyBuilder.createRandomCocktailModule())
        )
        
        let tabBarController = TabBarModuleBuilder.build(usingSubmodules: submodules)
        window.rootViewController = tabBarController
        UINavigationBar.appearance().tintColor = UIColor.label
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
