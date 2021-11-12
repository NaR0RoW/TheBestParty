import UIKit

typealias Tabs = (
    cocktails: UIViewController,
    favoritesCocktails: UIViewController,
    ingredients: UIViewController,
    randomCocktail: UIViewController
)

class TabBarController: UITabBarController {
    init(tabs: Tabs) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.cocktails, tabs.favoritesCocktails, tabs.ingredients, tabs.randomCocktail]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
}
