import RealmSwift

protocol RealmManagerProtocol {
    func addToFavorite(cocktail: CocktailObject?)
    func checkIfThereAreAnyFavoritesCocktails(cocktail: CocktailObject?) -> Bool
    func configureNumberOfItemsInSection() -> Int
    func configureCellForItemAt(index: Int) -> CocktailObject?
    func checkIfCocktailIsFavorite(cocktail: CocktailObject?) -> Bool
//    func filterCocktails(cocktail: CocktailModel?, searchType: SearchType)
//    func searchIn(cocktail: CocktailModel?, searchType: SearchType) -> [Cocktail]?
}

//enum SearchType {
//    case timeAdded
//    case name
//    case type
//    case alcoholType
//}

final class RealmManager: RealmManagerProtocol {
    // TO THINK: - Think for better solution
    public func addToFavorite(cocktail: CocktailObject?) {
        guard let realm = try? Realm() else { return }

        try? realm.write {
            guard let cocktailToAdd = cocktail?.cocktailName else { return }
            
            guard let cocktailsInRealmNames = cocktailsInRealmNames(cocktail: cocktail) else { return }

            if cocktailsInRealmNames.contains(cocktailToAdd) {
//                realm.delete(realmModel)
                
//                realm.delete(realm.objects(CocktailRealmModel.self).filter("cocktailToAdd = %@", cocktailToAdd))
//                try! realm.write {
//                    realm.delete(Realm.objects(ChecklistDataModel.self).filter("name=%@",checklists[indexPath.row].name))
//                }
            } else {
                realm.add(cocktail!, update: .all)
            }
        }
    }
    
    public func checkIfCocktailIsFavorite(cocktail: CocktailObject?) -> Bool {
        guard let cocktailToCheck = cocktail?.cocktailName else { return false }
        guard let cocktailsInRealmNames = cocktailsInRealmNames(cocktail: cocktail) else { return false }
        
        if cocktailsInRealmNames.contains(cocktailToCheck) {
            return true
        } else {
            return false
        }
    }
    
    private func cocktailsInRealmNames(cocktail: CocktailObject?) -> [String]? {
        guard let realm = try? Realm() else { return nil }
        
        var cocktailsInRealmNames = [String]()
        
        for element in realm.objects(CocktailObject.self) {
            guard let cocktailInRealmName = element.cocktailName else { return nil }
            
            cocktailsInRealmNames.append(cocktailInRealmName)
        }
        
        return cocktailsInRealmNames
    }
    
    public func checkIfThereAreAnyFavoritesCocktails(cocktail: CocktailObject?) -> Bool {
        guard let cocktailsInRealmNames = cocktailsInRealmNames(cocktail: cocktail) else { return false }
        
        return cocktailsInRealmNames.count == 0 ? true : false
    }
    
    public func configureNumberOfItemsInSection() -> Int {
        guard let realm = try? Realm() else { return 0 }
        let realmCocktails = realm.objects(CocktailObject.self)
        
        return realmCocktails.count
    }
    
    public func configureCellForItemAt(index: Int) -> CocktailObject? {
        guard let realm = try? Realm() else { return nil }
        let cocktails = realm.objects(CocktailObject.self)
        let result = cocktails[index]

        return result
    }
//
//    private func searchInRealm(cocktail: CocktailModel?, searchType: SearchType) -> [String]? {
//        guard let realm = try? Realm() else { return nil }
//
//        var searchInRealm = [String]()
//
//        for element in realm.objects(CocktailRealmModel.self) {
//            guard let cocktail = element.cocktailsRealm?.drinks.first else { return nil }
//
//            switch searchType {
//            case .name:
//                let find = cocktail.cocktailName
//                searchInRealm.append(find!)
//
//            case .timeAdded:
//                let find = cocktail.cocktailName
//                searchInRealm.append(find!)
//
//            case .type:
//                let find = cocktail.cocktailType
//                searchInRealm.append(find!)
//
//            case .alcoholType:
//                let find = cocktail.cocktailCategory
//                searchInRealm.append(find!)
//
//            }
//        }
//
//        return searchInRealm
//    }
//
//    public func filterCocktails(cocktail: CocktailModel?, searchType: SearchType) {
//        switch searchType {
//        case .timeAdded:
//            let array = searchInRealm(cocktail: cocktail, searchType: .timeAdded)
//            let sorted = array?.sorted {
//                $0 < $1
//            }
//            print(sorted as Any)
//
//        case .name:
//            let array = searchInRealm(cocktail: cocktail, searchType: .name)
//            let sorted = array?.sorted {
//                $0 < $1
//            }
//            print(sorted as Any)
//
//        case .type:
//            let array = searchInRealm(cocktail: cocktail, searchType: .type)
//            let sorted = array?.sorted {
//                $0 < $1
//            }
//            print(sorted as Any)
//
//        case .alcoholType:
//            let array = searchInRealm(cocktail: cocktail, searchType: .alcoholType)
//            let sorted = array?.sorted {
//                $0 < $1
//            }
//            print(sorted as Any)
//
//        }
//    }
//    public func searchIn(cocktail: CocktailModel?, searchType: SearchType) -> [Cocktail]? {
//        guard let realm = try? Realm() else { return nil }
//
//        var array = Array<Cocktail>()
//
//        for element in realm.objects(CocktailRealmModel.self) {
//            guard let cocktail = element.cocktailsRealm?.drinks else { return nil }
//
//            array.append(contentsOf: cocktail)
//        }
//
//        switch searchType {
//        case .timeAdded:
//            let find = array.sorted {
//                $0.cocktailName! < $1.cocktailName!
//            }
//            return find
//        case .name:
//            let find = array.sorted {
//                $0.cocktailName! < $1.cocktailName!
//            }
//            return find
//        case .type:
//            let find = array.sorted {
//                $0.cocktailCategory! < $1.cocktailCategory!
//            }
//            return find
//        case .alcoholType:
//            let find = array.sorted {
//                $0.cocktailType! < $1.cocktailType!
//            }
//            return find
//        }
//    }
//
//    public func searchInn(cocktail: CocktailModel?, searchType: SearchType) -> [Cocktail]? {
//        guard let realm = try? Realm() else { return nil }
//
//        var array = Array<CocktailRealmModel>()
//        array = Array(realm.objects(CocktailRealmModel.self))
//
//
//        switch searchType {
//        case .timeAdded:
//            let find = array.sorted {
//                $0.cocktailName! < $1.cocktailName!
//            }
//            return find
//        case .name:
//            let find = array.sorted {
//                $0.cocktailName! < $1.cocktailName!
//            }
//            return find
//        case .type:
//            let find = array.sorted {
//                $0.cocktailCategory! < $1.cocktailCategory!
//            }
//            return find
//        case .alcoholType:
//            let find = array.sorted {
//                $0.cocktailType! < $1.cocktailType!
//            }
//            return find
//        }
//    }
}
