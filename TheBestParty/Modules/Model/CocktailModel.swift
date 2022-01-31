//import Foundation
//
//public struct CocktailModel: Codable {
//    public let drinks: [Cocktail]
//}
//
//public struct Cocktail: Codable {
//    public let cocktailName: String?
//    public let cocktailCategory: String?
//    public let cocktailGlass: String?
//    public let cocktailInstructions: String?
//    public let cocktailImage: String?
//    public let cocktailType: String?
//    public let cocktailFirstIngredient: String?
//    public let cocktailSecondIngredient: String?
//    public let cocktailThirdIngredient: String?
//    public let cocktailFourthIngredient: String?
//    public let cocktailFifthIngredient: String?
//    public let cocktailSixthIngredient: String?
//    public let cocktailSeventhIngredient: String?
//    public let cocktailEighthIngredient: String?
//    public let cocktailNinthIngredient: String?
//    public let cocktailTenthIngredient: String?
//    public let cocktailEleventhIngredient: String?
//    public let cocktailTwelfthIngredient: String?
//    public let cocktailThirteenthIngredient: String?
//    public let cocktailFourteenthIngredient: String?
//    public let cocktailFifteenthIngredient: String?
//    public let cocktailFirstIngredientMeasure: String?
//    public let cocktailSecondIngredientMeasure: String?
//    public let cocktailThirdIngredientMeasure: String?
//    public let cocktailFourthIngredientMeasure: String?
//    public let cocktailFifthIngredientMeasure: String?
//    public let cocktailSixthIngredientMeasure: String?
//    public let cocktailSeventhIngredientMeasure: String?
//    public let cocktailEighthIngredientMeasure: String?
//    public let cocktailNinthIngredientMeasure: String?
//    public let cocktailTenthIngredientMeasure: String?
//    public let cocktailEleventhIngredientMeasure: String?
//    public let cocktailTwelfthIngredientMeasure: String?
//    public let cocktailThirteenthIngredientMeasure: String?
//    public let cocktailFourteenthIngredientMeasure: String?
//    public let cocktailFifteenthIngredientMeasure: String?
//}
//
//extension Cocktail {
//    enum CodingKeys: String, CodingKey {
//        case cocktailName = "strDrink"
//        case cocktailCategory = "strCategory"
//        case cocktailGlass = "strGlass"
//        case cocktailInstructions = "strInstructions"
//        case cocktailImage = "strDrinkThumb"
//        case cocktailType = "strAlcoholic"
//        case cocktailFirstIngredient = "strIngredient1"
//        case cocktailSecondIngredient = "strIngredient2"
//        case cocktailThirdIngredient = "strIngredient3"
//        case cocktailFourthIngredient = "strIngredient4"
//        case cocktailFifthIngredient = "strIngredient5"
//        case cocktailSixthIngredient = "strIngredient6"
//        case cocktailSeventhIngredient = "strIngredient7"
//        case cocktailEighthIngredient = "strIngredient8"
//        case cocktailNinthIngredient = "strIngredient9"
//        case cocktailTenthIngredient = "strIngredient10"
//        case cocktailEleventhIngredient = "strIngredient11"
//        case cocktailTwelfthIngredient = "strIngredient12"
//        case cocktailThirteenthIngredient = "strIngredient13"
//        case cocktailFourteenthIngredient = "strIngredient14"
//        case cocktailFifteenthIngredient = "strIngredient15"
//        case cocktailFirstIngredientMeasure = "strMeasure1"
//        case cocktailSecondIngredientMeasure = "strMeasure2"
//        case cocktailThirdIngredientMeasure = "strMeasure3"
//        case cocktailFourthIngredientMeasure = "strMeasure4"
//        case cocktailFifthIngredientMeasure = "strMeasure5"
//        case cocktailSixthIngredientMeasure = "strMeasure6"
//        case cocktailSeventhIngredientMeasure = "strMeasure7"
//        case cocktailEighthIngredientMeasure = "strMeasure8"
//        case cocktailNinthIngredientMeasure = "strMeasure9"
//        case cocktailTenthIngredientMeasure = "strMeasure10"
//        case cocktailEleventhIngredientMeasure = "strMeasure11"
//        case cocktailTwelfthIngredientMeasure = "strMeasure12"
//        case cocktailThirteenthIngredientMeasure = "strMeasure13"
//        case cocktailFourteenthIngredientMeasure = "strMeasure14"
//        case cocktailFifteenthIngredientMeasure = "strMeasure15"
//    }
//}

import Foundation
import RealmSwift

final class CocktailModelObject: Object, Codable { // CocktailModel
    var drinks = List<CocktailObject>() // let ?
//    
//    required init(drinks: List<CocktailObject>) {
//        self.drinks = drinks
//    }
}

final class CocktailObject: Object, Codable { // Cocktail
    @objc dynamic var cocktailName: String?
    @objc dynamic var cocktailCategory: String?
    @objc dynamic var cocktailGlass: String?
    @objc dynamic var cocktailInstructions: String?
    @objc dynamic var cocktailImage: String?
    @objc dynamic var cocktailType: String?
    @objc dynamic var cocktailFirstIngredient: String?
    @objc dynamic var cocktailSecondIngredient: String?
    @objc dynamic var cocktailThirdIngredient: String?
    @objc dynamic var cocktailFourthIngredient: String?
    @objc dynamic var cocktailFifthIngredient: String?
    @objc dynamic var cocktailSixthIngredient: String?
    @objc dynamic var cocktailSeventhIngredient: String?
    @objc dynamic var cocktailEighthIngredient: String?
    @objc dynamic var cocktailNinthIngredient: String?
    @objc dynamic var cocktailTenthIngredient: String?
    @objc dynamic var cocktailEleventhIngredient: String?
    @objc dynamic var cocktailTwelfthIngredient: String?
    @objc dynamic var cocktailThirteenthIngredient: String?
    @objc dynamic var cocktailFourteenthIngredient: String?
    @objc dynamic var cocktailFifteenthIngredient: String?
    @objc dynamic var cocktailFirstIngredientMeasure: String?
    @objc dynamic var cocktailSecondIngredientMeasure: String?
    @objc dynamic var cocktailThirdIngredientMeasure: String?
    @objc dynamic var cocktailFourthIngredientMeasure: String?
    @objc dynamic var cocktailFifthIngredientMeasure: String?
    @objc dynamic var cocktailSixthIngredientMeasure: String?
    @objc dynamic var cocktailSeventhIngredientMeasure: String?
    @objc dynamic var cocktailEighthIngredientMeasure: String?
    @objc dynamic var cocktailNinthIngredientMeasure: String?
    @objc dynamic var cocktailTenthIngredientMeasure: String?
    @objc dynamic var cocktailEleventhIngredientMeasure: String?
    @objc dynamic var cocktailTwelfthIngredientMeasure: String?
    @objc dynamic var cocktailThirteenthIngredientMeasure: String?
    @objc dynamic var cocktailFourteenthIngredientMeasure: String?
    @objc dynamic var cocktailFifteenthIngredientMeasure: String?
}

extension CocktailObject {
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
        case cocktailFifthIngredient = "strIngredient5"
        case cocktailSixthIngredient = "strIngredient6"
        case cocktailSeventhIngredient = "strIngredient7"
        case cocktailEighthIngredient = "strIngredient8"
        case cocktailNinthIngredient = "strIngredient9"
        case cocktailTenthIngredient = "strIngredient10"
        case cocktailEleventhIngredient = "strIngredient11"
        case cocktailTwelfthIngredient = "strIngredient12"
        case cocktailThirteenthIngredient = "strIngredient13"
        case cocktailFourteenthIngredient = "strIngredient14"
        case cocktailFifteenthIngredient = "strIngredient15"
        case cocktailFirstIngredientMeasure = "strMeasure1"
        case cocktailSecondIngredientMeasure = "strMeasure2"
        case cocktailThirdIngredientMeasure = "strMeasure3"
        case cocktailFourthIngredientMeasure = "strMeasure4"
        case cocktailFifthIngredientMeasure = "strMeasure5"
        case cocktailSixthIngredientMeasure = "strMeasure6"
        case cocktailSeventhIngredientMeasure = "strMeasure7"
        case cocktailEighthIngredientMeasure = "strMeasure8"
        case cocktailNinthIngredientMeasure = "strMeasure9"
        case cocktailTenthIngredientMeasure = "strMeasure10"
        case cocktailEleventhIngredientMeasure = "strMeasure11"
        case cocktailTwelfthIngredientMeasure = "strMeasure12"
        case cocktailThirteenthIngredientMeasure = "strMeasure13"
        case cocktailFourteenthIngredientMeasure = "strMeasure14"
        case cocktailFifteenthIngredientMeasure = "strMeasure15"
    }
}
