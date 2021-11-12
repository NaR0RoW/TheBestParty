import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let submodules = (
            cocktails: UINavigationController(rootViewController: CocktailsViewController()),
            favoritesCocktails: UINavigationController(rootViewController: FavoritesCocktailsViewController()),
            ingredients: UINavigationController(rootViewController: IngredientsViewController()),
            randomCocktail: UINavigationController(rootViewController: RandomCocktailViewController())
        )

        let tabBarController = TabBarModuleBuilder.build(usingSubmodules: submodules)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
