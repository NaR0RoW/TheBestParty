import UIKit
import RealmSwift

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