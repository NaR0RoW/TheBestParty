import UIKit

final class TabBarRouter {
    var view: UIViewController?
    
    typealias Submodules = (
        cocktails: UIViewController,
        favoritesCocktails: UIViewController,
        randomCocktail: UIViewController
    )
    
    init(view: UIViewController?) {
        self.view = view
    }
}

extension TabBarRouter {
    static func tabs(usingSubmodules submodules: Submodules) -> Tabs {
        let cocktailsTabBarItem = UITabBarItem(title: "Cocktails", image: UIImage(named: "cocktail"), tag: 1)
        let favoritesCocktailsTabBarItem = UITabBarItem(title: "Favorite", image: UIImage(named: "heart"), tag: 2)
        let randomCocktailTabBarItem = UITabBarItem(title: "Random", image: UIImage(named: "dices"), tag: 3)
        
        submodules.cocktails.tabBarItem = cocktailsTabBarItem
        submodules.favoritesCocktails.tabBarItem = favoritesCocktailsTabBarItem
        submodules.randomCocktail.tabBarItem = randomCocktailTabBarItem
        
        return (
            cocktails: submodules.cocktails,
            favoritesCocktails: submodules.favoritesCocktails,
            randomCocktail: submodules.randomCocktail
        )
    }
}
