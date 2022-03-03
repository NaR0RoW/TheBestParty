@testable import TheBestParty
import RealmSwift
import XCTest

final private class MockCollectionView: CollectionViewProtocol {
    func success() {}
    func failure(error: Error) {}
}

final private class MockNetworkManager: NetworkProviderForCocktails {
    var cocktails: CocktailModelObject!
    
    init() {}
    
    convenience init(cocktails: CocktailModelObject?) {
        self.init()
        self.cocktails = cocktails
    }
    
    func getCocktails(searchTerm: String, completion: @escaping (Result<CocktailModelObject, APIError>) -> Void) {
        if let cocktails = cocktails {
            completion(.success(cocktails))
        } else {
            let error = APIError.internalError
            completion(.failure(error))
        }
    }
}

final private class CollectionPresenterTests: XCTestCase {
    var view: MockCollectionView!
    var sut: CollectionPresenter!
    var networkManager: NetworkProviderForCocktails!
    var router: RouterProtocol!
    var cocktails = [CocktailModelObject]()

    override func setUpWithError() throws {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        
        let navigationController = UINavigationController()
        let assemblyModuleBuilder = AssemblyModuleBuilder()
        
        self.router = Router(navigationController: navigationController, assemblyBuilder: assemblyModuleBuilder)
    }
    
    override func tearDownWithError() throws {
        self.view = nil
        self.sut = nil
        self.networkManager = nil
    }
    
    func createCocktail() -> CocktailModelObject {
        let realm = try! Realm()
        
        let cocktail = CocktailModelObject()
        cocktail.drinks.first?.cocktailName = "Foo"
        
        try? realm.write {
            realm.add(cocktail)
        }
        
        return cocktail
    }
    
    func testGetCocktailsSuccessfully() {
        self.cocktails = [createCocktail()]
        self.view = MockCollectionView()
        self.networkManager = MockNetworkManager(cocktails: cocktails.first)
        self.sut = CollectionPresenter(view: view, networkManager: networkManager, router: router)
        
        var catchCocktails: [CocktailModelObject]!
        
        networkManager.getCocktails(searchTerm: "") { result in
            switch result {
            case .success(let cocktails):
                catchCocktails = [cocktails]
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchCocktails?.count, 0)
        XCTAssertEqual(catchCocktails?.count, cocktails.count)
    }
    
    func testGetCocktailsFailure() {
        self.cocktails = [createCocktail()]
        self.view = MockCollectionView()
        self.networkManager = MockNetworkManager()
        self.sut = CollectionPresenter(view: view, networkManager: networkManager, router: router)
        
        var catchError: Error!
        
        networkManager.getCocktails(searchTerm: "") { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                catchError = error
            }
        }
        
        XCTAssertNotNil(catchError)
    }
}
