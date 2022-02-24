@testable import TheBestParty
import RealmSwift
import XCTest

final class MockCocktailsCollectionView: CocktailsCollectionViewProtocol {
    func success() {}
    func failure(error: Error) {}
}

final class MockNetworkManager: NetworkProviderForCocktails {
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

class XCRealmTestCase: XCTestCase {
    override func setUp() {
        super.setUp()
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
    }
}

final class CocktailsCollectionViewPresenterTests: XCRealmTestCase {
    var view: MockCocktailsCollectionView!
    var presenter: CocktailsCollectionViewPresenter!
    var networkManager: NetworkProviderForCocktails!
    var router: RouterProtocol!
    var cocktails = [CocktailModelObject]()

    override func setUpWithError() throws {
        let navigationController = UINavigationController()
        let assemblyModuleBuilder = AssemblyModuleBuilder()
        
        self.router = Router(navigationController: navigationController, assemblyBuilder: assemblyModuleBuilder)
    }
    
    override func tearDownWithError() throws {
        self.view = nil
        self.networkManager = nil
        self.presenter = nil
    }
    
    func testGetSuccessCocktails() {
        let realm = try? Realm()
        
        let cocktail = CocktailModelObject()
        cocktail.drinks.first?.cocktailName = "Foo"
        cocktail.drinks.first?.cocktailType = "Baz"
        cocktail.drinks.first?.cocktailCategory = "Bar"
        
        try? realm?.write {
            realm!.add(cocktail)
        }
        
        self.cocktails = [cocktail]
        
        self.view = MockCocktailsCollectionView()
        self.networkManager = MockNetworkManager(cocktails: cocktails.first)
        self.presenter = CocktailsCollectionViewPresenter(view: view, networkManager: networkManager, router: router)
        
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
    
    func testGetFailureCocktails() {
        let realm = try? Realm()
        
        let cocktail = CocktailModelObject()
        cocktail.drinks.first?.cocktailName = "Foo"
        cocktail.drinks.first?.cocktailType = "Baz"
        cocktail.drinks.first?.cocktailCategory = "Bar"
        
        try? realm?.write {
            realm!.add(cocktail)
        }
        
        self.cocktails = [cocktail]
        self.view = MockCocktailsCollectionView()
        self.networkManager = MockNetworkManager()
        self.presenter = CocktailsCollectionViewPresenter(view: view, networkManager: networkManager, router: router)
        
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
