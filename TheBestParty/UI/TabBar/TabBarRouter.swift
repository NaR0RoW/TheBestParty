import UIKit

class TabBarRouter {
    var view: UIViewController
    
    typealias Submodules = (
        cocktails: UIViewController,
        favoritesCocktails: UIViewController,
        ingredients: UIViewController,
        randomCocktail: UIViewController
    )
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension TabBarRouter {
    static func tabs(usingSubmodules submodules: Submodules) -> Tabs {
        let cocktailsTabBarItem = UITabBarItem(title: "Cocktails", image: UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysTemplate), tag: 1)
        let favoritesCocktailsTabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill")?.withRenderingMode(.alwaysTemplate), tag: 2)
        let ingredientsTabBarItem = UITabBarItem(title: "Ingredients", image: UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate), tag: 3)
        let randomCocktailTabBarItem = UITabBarItem(title: "Random", image: UIImage(systemName: "gear")?.withRenderingMode(.alwaysTemplate), tag: 4)
        
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
