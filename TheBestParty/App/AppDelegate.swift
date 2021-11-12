import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let submodules = (
            cocktails: CocktailsViewController(),
            ingredients: IngredientsViewController(),
            randomCocktail: RandomCocktailViewController()
        )

        let tabBarController = TabBarModuleBuilder.build(usingSubmodules: submodules)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}
