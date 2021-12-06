import Foundation
import RealmSwift

class CocktailRealmModel: Object {
    @objc private dynamic var structData: Data? = nil
    
    var cocktailsRealm: CocktailModel? {
        get {
            if let data = structData {
                return try? JSONDecoder().decode(CocktailModel.self, from: data)
            }
            return nil
        }
        set {
            structData = try? JSONEncoder().encode(newValue)
        }
    }
}
