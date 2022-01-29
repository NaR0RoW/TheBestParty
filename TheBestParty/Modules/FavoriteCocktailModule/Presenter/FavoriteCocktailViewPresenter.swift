import Foundation
import RealmSwift

protocol FavoriteCocktailViewProtocol: AnyObject {
    
}

protocol FavoriteCocktailViewPresenterProtocol: AnyObject {
    init(view: FavoriteCocktailViewProtocol)
    func configureNumberOfItemsInSection() -> Int
    func configureCellForItemAt(index: Int) -> CocktailModel?
}

final class FavoriteCocktailViewPresenter: FavoriteCocktailViewPresenterProtocol {
    weak var view: FavoriteCocktailViewProtocol?

    required init(view: FavoriteCocktailViewProtocol) {
        self.view = view
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
