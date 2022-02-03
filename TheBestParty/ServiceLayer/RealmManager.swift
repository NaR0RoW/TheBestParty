import RealmSwift

protocol RealmManagerProtocol {
    func addToFavorite(cocktail: CocktailModel?)
    func checkIfThereAreAnyFavoritesCocktails() -> Bool
    func configureNumberOfItemsInSection() -> Int
    func configureCellForItemAt(index: Int) -> CocktailModel?
    func checkIfCocktailIsFavorite(cocktail: CocktailModel?) -> Bool
}

final class RealmManager: RealmManagerProtocol {
    // TO THINK: - Think for better solution
    public func addToFavorite(cocktail: CocktailModel?) {
        guard let realm = try? Realm() else { return }
    
        try? realm.write {
            let realmModel = CocktailRealmModel()
            realmModel.cocktailsRealm = cocktail

            guard let cocktailToAdd = cocktail?.drinks.first?.cocktailName else { return }
            
            guard let cocktailsInRealmNames = cocktailsInRealmNames(cocktail: cocktail) else { return }

            if cocktailsInRealmNames.contains(cocktailToAdd) {
//                realm.delete(realmModel)
                
//                realm.delete(realm.objects(CocktailRealmModel.self).filter("cocktailToAdd = %@", cocktailToAdd))
//                try! realm.write {
//                    realm.delete(Realm.objects(ChecklistDataModel.self).filter("name=%@",checklists[indexPath.row].name))
//                }
                
            } else {
                realm.add(realmModel)
            }
        }
    }
    
    public func checkIfCocktailIsFavorite(cocktail: CocktailModel?) -> Bool {
        guard let cocktailToCheck = cocktail?.drinks.first?.cocktailName else { return false }
        guard let cocktailsInRealmNames = cocktailsInRealmNames(cocktail: cocktail) else { return false }
        
        if cocktailsInRealmNames.contains(cocktailToCheck) {
            return true
        } else {
            return false
        }
    }
    
    private func cocktailsInRealmNames(cocktail: CocktailModel?) -> [String]? {
        guard let realm = try? Realm() else { return nil }
        
        var cocktailsInRealmNames = [String]()
        
        for element in realm.objects(CocktailRealmModel.self) {
            guard let cocktailInRealmName = element.cocktailsRealm?.drinks.first?.cocktailName else { return nil }
            
            cocktailsInRealmNames.append(cocktailInRealmName)
        }
        
        return cocktailsInRealmNames
    }
    
    public func checkIfThereAreAnyFavoritesCocktails() -> Bool {
        guard let realm = try? Realm() else { return false }
        
        return realm.isEmpty
    }
    
    public func configureNumberOfItemsInSection() -> Int {
        guard let realm = try? Realm() else { return 0 }
        let realmCocktails = realm.objects(CocktailRealmModel.self)
        
        return realmCocktails.count
    }
    
    public func configureCellForItemAt(index: Int) -> CocktailModel? {
        guard let realm = try? Realm() else { return nil }
        let cocktails = realm.objects(CocktailRealmModel.self)
        let result = cocktails[index].cocktailsRealm

        return result
    }
}
