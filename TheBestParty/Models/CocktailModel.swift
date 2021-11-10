import Foundation

struct CocktailModel: Codable {
    let drinks: [Cocktail]
}

struct Cocktail: Codable {
    let strDrink: String?
    let strCategory: String?
    let strGlass: String?
    let strInstructions: String?
    let strDrinkThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
}

//{
//   "drinks":[
//      {
//         "idDrink":"17206",
//         "strDrink":"Mint Julep",
//         "strDrinkAlternate":null,
//         "strTags":"IBA,ContemporaryClassic",
//         "strVideo":null,
//         "strCategory":"Ordinary Drink",
//         "strIBA":null,
//         "strAlcoholic":"Alcoholic",
//         "strGlass":"Collins glass",
//         "strInstructions":"In a highball glass gently muddle the mint, sugar and water. Fill the glass with cracked ice, add Bourbon and stir well until the glass is well frosted. Garnish with a mint sprig.",
//         "strInstructionsES":null,
//         "strInstructionsDE":"In einem Highball-Glas die Minze, den Zucker und das Wasser vorsichtig verr\u00fchren. F\u00fcllen Sie das Glas mit gebrochenem Eis, f\u00fcgen Sie Bourbon hinzu und r\u00fchren Sie gut um, bis das Glas gut gefrostet ist. Mit einem Minzzweig garnieren.",
//         "strInstructionsFR":null,
//         "strInstructionsIT":"In un bicchiere highball pestare delicatamente la menta, lo zucchero e l'acqua.\r\nRiempite il bicchiere con ghiaccio tritato, aggiungete il Bourbon e mescolate bene fino a quando il bicchiere sar\u00e0 ben glassato.\r\nGuarnire con un rametto di menta.",
//         "strInstructionsZH-HANS":null,
//         "strInstructionsZH-HANT":null,
//         "strDrinkThumb":"https:\/\/www.thecocktaildb.com\/images\/media\/drink\/squyyq1439907312.jpg",
//         "strIngredient1":"Mint", www.thecocktaildb.com/images/ingredients/Mint.png
//         "strIngredient2":"Bourbon", www.thecocktaildb.com/images/ingredients/Bourbon.png
//         "strIngredient3":"Powdered sugar", www.thecocktaildb.com/images/ingredients/Powderedsugar.png
//         "strIngredient4":"Water", www.thecocktaildb.com/images/ingredients/Water.png

// www.thecocktaildb.com/images/ingredients/Aejo Rum.png

//         "strIngredient5":null,
//         "strIngredient6":null,
//         "strIngredient7":null,
//         "strIngredient8":null,
//         "strIngredient9":null,
//         "strIngredient10":null,
//         "strIngredient11":null,
//         "strIngredient12":null,
//         "strIngredient13":null,
//         "strIngredient14":null,
//         "strIngredient15":null,
//         "strMeasure1":"4 fresh ",
//         "strMeasure2":"2 1\/2 oz ",
//         "strMeasure3":"1 tsp ",
//         "strMeasure4":"2 tsp ",
//         "strMeasure5":null,
//         "strMeasure6":null,
//         "strMeasure7":null,
//         "strMeasure8":null,
//         "strMeasure9":null,
//         "strMeasure10":null,
//         "strMeasure11":null,
//         "strMeasure12":null,
//         "strMeasure13":null,
//         "strMeasure14":null,
//         "strMeasure15":null,
//         "strImageSource":null,
//         "strImageAttribution":null,
//         "strCreativeCommonsConfirmed":"No",
//         "dateModified":"2015-08-18 15:15:12"
//      }
//   ]
//}
