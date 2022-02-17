import RealmSwift

protocol RealmManagerProtocol {
    func tapToFavorite(cocktail: CocktailObject?)
    func isCocktailInRealm(cocktail: CocktailObject?) -> Bool
    func isThereAreAnyFavoriteCocktails(cocktail: CocktailObject?) -> Bool
    func cocktailsInRealm() -> [CocktailObject]?
    func sortCocktails(cocktail: CocktailObject?, sortType: SortType) -> [CocktailObject]?
}

enum SortType {
    case timeAdded
    case name
    case category
    case type
}

enum CocktailType {
    case all
    case ordinaryDrink
    case beer
    case cocktail
    case coffeeTea
}

final class RealmManager: RealmManagerProtocol {
    // TODO: - Think for better solution
    public func tapToFavorite(cocktail: CocktailObject?) {
        guard let cocktail = cocktail else { return }
        guard let realm = try? Realm() else { return }

        try? realm.write {
            if isCocktailInRealm(cocktail: cocktail) == true {
                // Fatal error
//                realm.delete(realm.objects(CocktailObject.self).filter("cocktailName=%@", cocktail.cocktailName as Any))
            } else {
                realm.add(cocktail, update: .all)
            }
        }
    }
    
    public func isCocktailInRealm(cocktail: CocktailObject?) -> Bool {
        guard let realm = try? Realm() else { return false }
        
        let object = realm.object(ofType: CocktailObject.self, forPrimaryKey: cocktail?.cocktailName)
   
        return cocktail?.cocktailName == object?.cocktailName ? true : false
    }
    
    public func isThereAreAnyFavoriteCocktails(cocktail: CocktailObject?) -> Bool {
        return cocktailsInRealmCount() == 0 ? true : false
    }
    
    private func cocktailsInRealmCount() -> Int {
        guard let realm = try? Realm() else { return 0 }
        let cocktailsInRealm = realm.objects(CocktailObject.self)
        
        return cocktailsInRealm.count
    }
    
    public func cocktailsInRealm() -> [CocktailObject]? {
        guard let realm = try? Realm() else { return nil }
        let cocktails = Array(realm.objects(CocktailObject.self))
        
        return cocktails
    }
    
    public func sortCocktails(cocktail: CocktailObject?, sortType: SortType) -> [CocktailObject]? {
        guard let realm = try? Realm() else { return nil }
        let realmObjects = realm.objects(CocktailObject.self)
        
        switch sortType {
        case .timeAdded:
            return Array(realmObjects)
        case .name:
            return Array(realmObjects.sorted(byKeyPath: "cocktailName"))
        case .category:
            return Array(realmObjects.sorted(byKeyPath: "cocktailCategory"))
        case .type:
            return Array(realmObjects.sorted(byKeyPath: "cocktailType"))
        }
    }
    
    public func filterCocktails(cocktail: CocktailObject?, cocktailType: CocktailType) -> [CocktailObject]? {
        guard let realm = try? Realm() else { return nil }
        let realmObjects = realm.objects(CocktailObject.self)
        var filteredArray = [CocktailObject]()
        
        switch cocktailType {
        case .all:
            return Array(realmObjects)
            
        case .ordinaryDrink:
            for cocktail in realmObjects.filter("cocktailCategory == 'Ordinary Drink'") {
                filteredArray.append(cocktail)
            }
        case .beer:
            for cocktail in realmObjects.filter("cocktailCategory == 'Beer'") {
                filteredArray.append(cocktail)
            }
        case .cocktail:
            for cocktail in realmObjects.filter("cocktailCategory == 'Cocktail'") {
                filteredArray.append(cocktail)
            }
        case .coffeeTea:
            for cocktail in realmObjects.filter("cocktailCategory == 'Coffee/Tea'") {
                filteredArray.append(cocktail)
            }
        }
        
        return filteredArray
    }
}
