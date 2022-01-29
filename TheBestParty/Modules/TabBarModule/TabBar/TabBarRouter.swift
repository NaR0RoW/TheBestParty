import UIKit

final class TabBarRouter {
    var view: UIViewController?
    
    typealias Submodules = (
        cocktails: UIViewController,
        favoritesCocktails: UIViewController,
        ingredients: UIViewController,
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
        let ingredientsTabBarItem = UITabBarItem(title: "Ingredients", image: UIImage(named: "recipe"), tag: 3)
        let randomCocktailTabBarItem = UITabBarItem(title: "Random", image: UIImage(named: "dices"), tag: 4)
        
        submodules.cocktails.tabBarItem = cocktailsTabBarItem
        submodules.favoritesCocktails.tabBarItem = favoritesCocktailsTabBarItem
        submodules.ingredients.tabBarItem = ingredientsTabBarItem
        submodules.randomCocktail.tabBarItem = randomCocktailTabBarItem
        
        return (
            cocktails: submodules.cocktails,
            favoritesCocktails: submodules.favoritesCocktails,
            ingredients: submodules.ingredients,
            randomCocktail: submodules.randomCocktail
        )
    }
}
