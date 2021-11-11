import Foundation

enum CellModel {
    case image(models: [CocktailModel])
    case ingredients(models: [CocktailModel])
    case instructions(models: [CocktailModel])
    case category(models: [CocktailModel])
    case glass(models: [CocktailModel])
}
