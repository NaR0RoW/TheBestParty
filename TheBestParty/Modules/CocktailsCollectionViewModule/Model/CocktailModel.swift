import Foundation

public struct CocktailModel: Codable {
    public let drinks: [Cocktail]
}

public struct Cocktail: Codable {
    public let cocktailName: String?
    public let cocktailCategory: String?
    public let cocktailGlass: String?
    public let cocktailInstructions: String?
    public let cocktailImage: String?
    public let cocktailType: String?
    public let cocktailFirstIngredient: String?
    public let cocktailSecondIngredient: String?
    public let cocktailThirdIngredient: String?
    public let cocktailFourthIngredient: String?
    public let cocktailFirstIngredientMeasure: String?
    public let cocktailSecondIngredientMeasure: String?
    public let cocktailThirdIngredientMeasure: String?
    public let cocktailFourthIngredientMeasure: String?
}

extension Cocktail {
    enum CodingKeys: String, CodingKey {
        case cocktailName = "strDrink"
        case cocktailCategory = "strCategory"
        case cocktailGlass = "strGlass"
        case cocktailInstructions = "strInstructions"
        case cocktailImage = "strDrinkThumb"
        case cocktailType = "strAlcoholic"
        case cocktailFirstIngredient = "strIngredient1"
        case cocktailSecondIngredient = "strIngredient2"
        case cocktailThirdIngredient = "strIngredient3"
        case cocktailFourthIngredient = "strIngredient4"
        case cocktailFirstIngredientMeasure = "strMeasure1"
        case cocktailSecondIngredientMeasure = "strMeasure2"
        case cocktailThirdIngredientMeasure = "strMeasure3"
        case cocktailFourthIngredientMeasure = "strMeasure4"
    }
}
