import Foundation
import RealmSwift

protocol RandomCocktailViewProtocol: AnyObject {
    func success(with cocktail: CocktailModelObject?, with dataSource: TableViewDataSourceProtocol?)
    func failure(error: Error)
}

protocol RandomCocktailViewPresenterProtocol: AnyObject {
    init(view: RandomCocktailViewProtocol, networkService: NetworkProviderForRandomCocktail, dataSource: TableViewDataSourceProtocol)
    func refresh()
//    func addToFavorite()
}

final class RandomCocktailViewPresenter: RandomCocktailViewPresenterProtocol {
    weak var view: RandomCocktailViewProtocol?
    let networkService: NetworkProviderForRandomCocktail?
    var dataSource: TableViewDataSourceProtocol?
    var cocktail: CocktailModelObject?
    
    required init(view: RandomCocktailViewProtocol, networkService: NetworkProviderForRandomCocktail, dataSource: TableViewDataSourceProtocol) {
        self.view = view
        self.networkService = networkService
        self.dataSource = dataSource
        
        getRandomCocktail()
    }
    
    public func getRandomCocktail() {
        networkService?.getRandomCocktail { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let cocktails):
                    self.cocktail = cocktails
                    self.view?.success(with: cocktails, with: self.dataSource)
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    public func refresh() {
        getRandomCocktail()
    }
    
//    public func addToFavorite() {
//        guard let realm = try? Realm() else { return }
//
//        try? realm.write {
//            let realmModel = CocktailRealmModel()
//            realmModel.cocktailsRealm = cocktail
//
//            // TO THINK: - Think for better solution
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
