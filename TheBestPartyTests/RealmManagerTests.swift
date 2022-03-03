@testable import TheBestParty
import RealmSwift
import XCTest

final private class RealmManagerTests: XCTestCase {
    var sut: RealmManager!
    var realm: Realm!
    
    override func setUpWithError() throws {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        
        self.sut = RealmManager()
        self.realm = try! Realm()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        self.realm = nil
    }
    
    enum ActionWithCocktail {
        case create
        case write
    }
    
    @discardableResult
    func createCocktail(_ action: ActionWithCocktail) -> CocktailObject {
        let cocktailToAdd = CocktailObject()
        cocktailToAdd.cocktailName = "Foo"
        
        switch action {
        case .create:
            break
        case .write:
            try! realm.write {
                realm.create(CocktailObject.self, value: cocktailToAdd, update: .all)
            }
        }
        
        return cocktailToAdd
    }
    
    func testTapToFavoriteCreate() {
        sut.tapToFavorite(cocktail: createCocktail(.create))
        
        let cocktailsInRealm = realm.objects(CocktailObject.self)
        
        XCTAssertEqual(cocktailsInRealm.count, 1)
    }
    
    func testTapToFavoriteDelete() {
        sut.tapToFavorite(cocktail: createCocktail(.write))
        
        let cocktailsInRealm = realm.objects(CocktailObject.self)
        
        XCTAssertEqual(cocktailsInRealm.count, 0)
    }
    
    func testIsCocktailInRealmSuccess() {
        let expectation = sut.isCocktailInRealm(cocktail: createCocktail(.write))
        
        XCTAssertTrue(expectation)
    }
    
    func testIsCocktailInRealmFailure() {
        let expectation = sut.isCocktailInRealm(cocktail: createCocktail(.create))
        
        XCTAssertFalse(expectation)
    }
    
    func testIsThereAreAnyFavoriteCocktailsSuccess() {
        createCocktail(.write)
        let expectation = sut.isThereAreAnyFavoriteCocktails()
        
        XCTAssertTrue(expectation)
    }
    
    func testIsThereAreAnyFavoriteCocktailsFailure() {
        let expectation = sut.isThereAreAnyFavoriteCocktails()
        
        XCTAssertFalse(expectation)
    }
    
    func testCocktailsInRealm() {
        let cocktails = sut.cocktailsInRealm()
        
        XCTAssertEqual(cocktails?.count, 0)
    }
    
    func testSortCocktails() {
        let firstCocktail = CocktailObject()
        firstCocktail.cocktailName = "Foo"
        firstCocktail.cocktailCategory = "Baz"
        firstCocktail.cocktailType = "Bar"
        
        let secondCocktail = CocktailObject()
        secondCocktail.cocktailName = "Bar"
        secondCocktail.cocktailCategory = "Foo"
        secondCocktail.cocktailType = "Baz"
        
        try! realm.write {
            realm.add(firstCocktail, update: .all)
            realm.add(secondCocktail, update: .all)
        }
        
        let timeAddedSorted = sut.sortCocktails(sortType: .timeAdded)
        XCTAssertEqual(timeAddedSorted, [firstCocktail, secondCocktail])
        
        let nameSorted = sut.sortCocktails(sortType: .name)
        XCTAssertEqual(nameSorted, [secondCocktail, firstCocktail])

        let categorySorted = sut.sortCocktails(sortType: .category)
        XCTAssertEqual(categorySorted, [firstCocktail, secondCocktail])

        let typeSorted = sut.sortCocktails(sortType: .type)
        XCTAssertEqual(typeSorted, [firstCocktail, secondCocktail])
    }
    
    func testFilterCocktails() {
        let ordinaryDrink = CocktailObject()
        ordinaryDrink.cocktailName = "Bar"
        ordinaryDrink.cocktailCategory = "Ordinary Drink"
        
        let beer = CocktailObject()
        beer.cocktailName = "Baz"
        beer.cocktailCategory = "Beer"

        let cocktail = CocktailObject()
        cocktail.cocktailName = "Quux"
        cocktail.cocktailCategory = "Cocktail"

        let coffeeTea = CocktailObject()
        coffeeTea.cocktailName = "Bat"
        coffeeTea.cocktailCategory = "Coffee / Tea"

        let shot = CocktailObject()
        shot.cocktailName = "Xyzzy"
        shot.cocktailCategory = "Shot"

        let punchPartyDrink = CocktailObject()
        punchPartyDrink.cocktailName = "Plugh"
        punchPartyDrink.cocktailCategory = "Punch / Party Drink"

        let softDrink = CocktailObject()
        softDrink.cocktailName = "Qwe"
        softDrink.cocktailCategory = "Soft Drink"

        let otherUnknown = CocktailObject()
        otherUnknown.cocktailName = "Asd"
        otherUnknown.cocktailCategory = "Other/Unknown"
        
        try! realm.write {
            realm.add(ordinaryDrink, update: .all)
            realm.add(beer, update: .all)
            realm.add(cocktail, update: .all)
            realm.add(coffeeTea, update: .all)
            realm.add(shot, update: .all)
            realm.add(punchPartyDrink, update: .all)
            realm.add(softDrink, update: .all)
            realm.add(otherUnknown, update: .all)
        }
        
        let ordinaryDrinkFiltered = sut.filterCocktails(cocktailType: .ordinaryDrink)
        XCTAssertEqual(ordinaryDrinkFiltered, [ordinaryDrink])
        
        let beerFiltered = sut.filterCocktails(cocktailType: .beer)
        XCTAssertEqual(beerFiltered, [beer])

        let cocktailFiltered = sut.filterCocktails(cocktailType: .cocktail)
        XCTAssertEqual(cocktailFiltered, [cocktail])

        let coffeeTeaFiltered = sut.filterCocktails(cocktailType: .coffeeTea)
        XCTAssertEqual(coffeeTeaFiltered, [coffeeTea])

        let shotFiltered = sut.filterCocktails(cocktailType: .shot)
        XCTAssertEqual(shotFiltered, [shot])

        let punchPartyDrinkFiltered = sut.filterCocktails(cocktailType: .punchPartyDrink)
        XCTAssertEqual(punchPartyDrinkFiltered, [punchPartyDrink])

        let softDrinkFiltered = sut.filterCocktails(cocktailType: .softDrink)
        XCTAssertEqual(softDrinkFiltered, [softDrink])

        let otherUnknownFiltered = sut.filterCocktails(cocktailType: .otherUnknown)
        XCTAssertEqual(otherUnknownFiltered, [otherUnknown])

        let allFiltered = sut.filterCocktails(cocktailType: .all)
        XCTAssertEqual(allFiltered, [ordinaryDrink, beer, cocktail, coffeeTea, shot, punchPartyDrink, softDrink, otherUnknown])
    }
}
