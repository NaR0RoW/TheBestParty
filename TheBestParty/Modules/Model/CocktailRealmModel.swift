//import Foundation
//import RealmSwift
//
//final class CocktailRealmModel: Object {
//    @objc private dynamic var structData: Data? = nil
////    @objc dynamic var id = ""
//    
//    var cocktailsRealm: CocktailModel? {
//        get {
//            if let data = structData {
//                return try? JSONDecoder().decode(CocktailModel.self, from: data)
//            }
//            return nil
//        }
//        set {
//            structData = try? JSONEncoder().encode(newValue)
//        }
//    }
//    
////    override class func primaryKey() -> String? {
////        return "id"
////    }
//}
