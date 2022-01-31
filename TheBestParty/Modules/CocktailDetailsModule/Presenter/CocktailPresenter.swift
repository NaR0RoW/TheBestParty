import Foundation
import RealmSwift

protocol CocktailDetailsViewProtocol: AnyObject {
    func setupDetails(with cocktail: CocktailModelObject?, with dataSource: TableViewDataSourceProtocol?)
}

protocol CocktailDetailsViewPresenterProtocol: AnyObject {
    init(view: CocktailDetailsViewProtocol, cocktail: CocktailModelObject?, router: RouterProtocol, dataSource: TableViewDataSourceProtocol)
    func setupDetails()
    func popToRoot()
//    func addToFavorite()
}

final class CocktailDetailsViewPresenter: CocktailDetailsViewPresenterProtocol {
    weak var view: CocktailDetailsViewProtocol?
    var cocktail: CocktailModelObject?
    var router: RouterProtocol?
    var dataSource: TableViewDataSourceProtocol?
    
    required init(view: CocktailDetailsViewProtocol, cocktail: CocktailModelObject?, router: RouterProtocol, dataSource: TableViewDataSourceProtocol) {
        self.view = view
        self.cocktail = cocktail
        self.router = router
        self.dataSource = dataSource
    }
    
    public func setupDetails() {
        self.view?.setupDetails(with: cocktail, with: dataSource)
    }
    
    public func popToRoot() {
        router?.popToRoot()
    }
    
//    public func addToFavorite() {
//        guard let realm = try? Realm() else { return }
//
//        try? realm.write {
//            let realmModel = CocktailRealmModel()
//            realmModel.cocktailsRealm = cocktail
//
////             TO THINK: - Think for better solution
//            var cocktailsInRealmNames = [String]()
//            guard let cocktailToAdd = cocktail?.drinks.first?.cocktailName else { return }
//
//            for element in realm.objects(CocktailRealmModel.self) {
//                guard let cocktailInRealmName = element.cocktailsRealm?.drinks.first?.cocktailName else { return }
//
//                cocktailsInRealmNames.append(cocktailInRealmName)
//            }
//
//            if !cocktailsInRealmNames.contains(cocktailToAdd) {
//                realm.add(realmModel)
//            }
//        }
//    }
}
