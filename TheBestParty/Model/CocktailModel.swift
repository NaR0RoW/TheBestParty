import Foundation
import RealmSwift

@objcMembers final class CocktailModelObject: Object, Codable {
    var drinks = List<CocktailObject>()
}

@objcMembers final class CocktailObject: Object, Codable {
    dynamic var cocktailName: String? = ""
    dynamic var cocktailCategory: String? = ""
    dynamic var cocktailGlass: String? = ""
    dynamic var cocktailInstructions: String? = ""
    dynamic var cocktailImage: String? = ""
    dynamic var cocktailType: String? = ""
    dynamic var cocktailFirstIngredient: String? = ""
    dynamic var cocktailSecondIngredient: String? = ""
    dynamic var cocktailThirdIngredient: String? = ""
    dynamic var cocktailFourthIngredient: String? = ""
    dynamic var cocktailFifthIngredient: String? = ""
    dynamic var cocktailSixthIngredient: String? = ""
    dynamic var cocktailSeventhIngredient: String? = ""
    dynamic var cocktailEighthIngredient: String? = ""
    dynamic var cocktailNinthIngredient: String? = ""
    dynamic var cocktailTenthIngredient: String? = ""
    dynamic var cocktailEleventhIngredient: String? = ""
    dynamic var cocktailTwelfthIngredient: String? = ""
    dynamic var cocktailThirteenthIngredient: String? = ""
    dynamic var cocktailFourteenthIngredient: String? = ""
    dynamic var cocktailFifteenthIngredient: String? = ""
    dynamic var cocktailFirstIngredientMeasure: String? = ""
    dynamic var cocktailSecondIngredientMeasure: String? = ""
    dynamic var cocktailThirdIngredientMeasure: String? = ""
    dynamic var cocktailFourthIngredientMeasure: String? = ""
    dynamic var cocktailFifthIngredientMeasure: String? = ""
    dynamic var cocktailSixthIngredientMeasure: String? = ""
    dynamic var cocktailSeventhIngredientMeasure: String? = ""
    dynamic var cocktailEighthIngredientMeasure: String? = ""
    dynamic var cocktailNinthIngredientMeasure: String? = ""
    dynamic var cocktailTenthIngredientMeasure: String? = ""
    dynamic var cocktailEleventhIngredientMeasure: String? = ""
    dynamic var cocktailTwelfthIngredientMeasure: String? = ""
    dynamic var cocktailThirteenthIngredientMeasure: String? = ""
    dynamic var cocktailFourteenthIngredientMeasure: String? = ""
    dynamic var cocktailFifteenthIngredientMeasure: String? = ""

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
    
    func decode(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        cocktailName = try? container.decode(String.self, forKey: .cocktailName)
        cocktailCategory = try? container.decode(String.self, forKey: .cocktailCategory)
        cocktailGlass = try? container.decode(String.self, forKey: .cocktailGlass)
        cocktailInstructions = try? container.decode(String.self, forKey: .cocktailInstructions)
        cocktailImage = try? container.decode(String.self, forKey: .cocktailImage)
        cocktailType = try? container.decode(String.self, forKey: .cocktailType)
        cocktailFirstIngredient = try? container.decode(String.self, forKey: .cocktailFirstIngredient)
        cocktailSecondIngredient = try? container.decode(String.self, forKey: .cocktailSecondIngredient)
        cocktailThirdIngredient = try? container.decode(String.self, forKey: .cocktailThirdIngredient)
        cocktailFourthIngredient = try? container.decode(String.self, forKey: .cocktailFourthIngredient)
        cocktailFifthIngredient = try? container.decode(String.self, forKey: .cocktailFifthIngredient)
        cocktailSixthIngredient = try? container.decode(String.self, forKey: .cocktailSixthIngredient)
        cocktailSeventhIngredient = try? container.decode(String.self, forKey: .cocktailSeventhIngredient)
        cocktailEighthIngredient = try? container.decode(String.self, forKey: .cocktailEighthIngredient)
        cocktailNinthIngredient = try? container.decode(String.self, forKey: .cocktailNinthIngredient)
        cocktailTenthIngredient = try? container.decode(String.self, forKey: .cocktailTenthIngredient)
        cocktailEleventhIngredient = try? container.decode(String.self, forKey: .cocktailEleventhIngredient)
        cocktailTwelfthIngredient = try? container.decode(String.self, forKey: .cocktailTwelfthIngredient)
        cocktailThirteenthIngredient = try? container.decode(String.self, forKey: .cocktailThirteenthIngredient)
        cocktailFourteenthIngredient = try? container.decode(String.self, forKey: .cocktailFourteenthIngredient)
        cocktailFifteenthIngredient = try? container.decode(String.self, forKey: .cocktailFifteenthIngredient)
        cocktailFirstIngredientMeasure = try? container.decode(String.self, forKey: .cocktailFirstIngredientMeasure)
        cocktailSecondIngredientMeasure = try? container.decode(String.self, forKey: .cocktailSecondIngredientMeasure)
        cocktailThirdIngredientMeasure = try? container.decode(String.self, forKey: .cocktailThirdIngredientMeasure)
        cocktailFourthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailFourthIngredientMeasure)
        cocktailFifthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailFifthIngredientMeasure)
        cocktailSixthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailSixthIngredientMeasure)
        cocktailSeventhIngredientMeasure = try? container.decode(String.self, forKey: .cocktailSeventhIngredientMeasure)
        cocktailEighthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailEighthIngredientMeasure)
        cocktailNinthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailNinthIngredientMeasure)
        cocktailTenthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailTenthIngredientMeasure)
        cocktailEleventhIngredientMeasure = try? container.decode(String.self, forKey: .cocktailEleventhIngredientMeasure)
        cocktailTwelfthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailTwelfthIngredientMeasure)
        cocktailThirteenthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailThirteenthIngredientMeasure)
        cocktailFourteenthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailFourteenthIngredientMeasure)
        cocktailFifteenthIngredientMeasure = try? container.decode(String.self, forKey: .cocktailFifteenthIngredientMeasure)
    }
    
    override class func primaryKey() -> String? {
        return "cocktailName"
    }
}
