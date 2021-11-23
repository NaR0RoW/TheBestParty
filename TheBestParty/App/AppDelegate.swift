import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
//        let navigationController = UINavigationController()
//        let assemblyBuilder = AssemblyModuleBuilder()
//        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
//        router.initialViewController()
//
//        let submodules = (
//            cocktails: navigationController,
//            favoritesCocktails: UINavigationController(rootViewController: FavoritesCocktailsViewController()),
//            ingredients: UINavigationController(rootViewController: IngredientsViewController()),
//            randomCocktail: UINavigationController(rootViewController: RandomCocktailViewController())
//        )
//
//        let tabBarController = TabBarModuleBuilder.build(usingSubmodules: submodules)
//        window.rootViewController = tabBarController
        
        window.rootViewController = SomeViewController(cocktails: CocktailModel(drinks: [Cocktail(cocktailName: "1", cocktailCategory: "2", cocktailGlass: "3", cocktailInstructions: "4", cocktailImage: "5", cocktailType: "6", cocktailFirstIngredient: "7", cocktailSecondIngredient: "8", cocktailThirdIngredient: "9", cocktailFourthIngredient: "10", cocktailFirstIngredientMeasure: "11", cocktailSecondIngredientMeasure: "12", cocktailThirdIngredientMeasure: "13", cocktailFourthIngredientMeasure: "14")]))
        
        
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
