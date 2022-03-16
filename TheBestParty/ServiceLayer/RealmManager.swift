import RealmSwift

protocol RealmManagerProtocol {
    func tapToFavorite(cocktail: CocktailObject?)
    func isCocktailInRealm(cocktail: CocktailObject?) -> Bool
    func isThereAreAnyFavoriteCocktails() -> Bool
    func cocktailsInRealm() -> [CocktailObject]?
    func filterCocktails(cocktailType: CocktailType) -> [CocktailObject]?
    var isItNecessaryToPopViewController: Bool { get set }
}

enum CocktailType {
    case all
    case ordinaryDrink
    case beer
    case cocktail
    case coffeeTea
    case shot
    case punchPartyDrink
    case softDrink
    case homemadeLiqueur
    case otherUnknown
}

final class RealmManager: RealmManagerProtocol {
    var isItNecessaryToPopViewController = false
    
    func tapToFavorite(cocktail: CocktailObject?) {
        guard let newCocktail = cocktail else { return }
        guard let realm = try? Realm() else { return }
        
        try? realm.write {
            if isCocktailInRealm(cocktail: newCocktail) == true {
                realm.delete(realm.objects(CocktailObject.self).filter("cocktailName=%@", newCocktail.cocktailName as Any))
                isItNecessaryToPopViewController = true
            } else {
                realm.create(CocktailObject.self, value: newCocktail, update: .all)
            }
        }
    }
    
    func isCocktailInRealm(cocktail: CocktailObject?) -> Bool {
        guard let realm = try? Realm() else { return false }
        
        let object = realm.object(ofType: CocktailObject.self, forPrimaryKey: cocktail?.cocktailName)
   
        return cocktail?.cocktailName == object?.cocktailName ? true : false
    }
    
    func isThereAreAnyFavoriteCocktails() -> Bool {
        guard let realm = try? Realm() else { return false }
        let cocktailsInRealm = realm.objects(CocktailObject.self)
        
        return cocktailsInRealm.count == 0 ? false : true
    }
    
    func cocktailsInRealm() -> [CocktailObject]? {
        guard let realm = try? Realm() else { return nil }
        let cocktails = Array(realm.objects(CocktailObject.self))
        
        return cocktails
    }
    
    func filterCocktails(cocktailType: CocktailType) -> [CocktailObject]? {
        guard let realm = try? Realm() else { return nil }
        let realmObjects = realm.objects(CocktailObject.self)
        
        switch cocktailType {
        case .all:
            return Array(realmObjects)
            
        case .ordinaryDrink:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Ordinary Drink'"))
            
        case .beer:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Beer'"))
            
        case .cocktail:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Cocktail'"))
            
        case .coffeeTea:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Coffee / Tea'"))
            
        case .shot:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Shot'"))
            
        case .punchPartyDrink:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Punch / Party Drink'"))
            
        case .softDrink:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Soft Drink'"))
            
        case .homemadeLiqueur:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Homemade Liqueur'"))
            
        case .otherUnknown:
            return Array(realmObjects.filter("cocktailCategory CONTAINS 'Other/Unknown'"))
        }
    }
}
