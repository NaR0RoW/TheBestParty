import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        let assemblyBuilder = AssemblyModuleBuilder()
        
        let collectionViewController = UINavigationController()
        let collectionRouter = Router(navigationController: collectionViewController, assemblyBuilder: assemblyBuilder)
        collectionRouter.initialViewController(for: .collection)
        
        let favoritesViewController = UINavigationController()
        let favoritesRouter = Router(navigationController: favoritesViewController, assemblyBuilder: assemblyBuilder)
        favoritesRouter.initialViewController(for: .favorites)

        let submodules = (
            cocktails: collectionViewController,
            favoritesCocktails: favoritesViewController,
            randomCocktail: UINavigationController(rootViewController: assemblyBuilder.createRandomCocktailModule())
        )
        
        let tabBarController = TabBarModuleBuilder.build(usingSubmodules: submodules)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        return true
    }
}
