import Foundation

protocol CocktailDetailsViewProtocol: AnyObject {
    func setupDetails(with cocktail: CocktailModel?, with dataSource: TableViewDataSourceProtocol?)
}

protocol CocktailDetailsViewPresenterProtocol: AnyObject {
    init(view: CocktailDetailsViewProtocol, cocktail: CocktailModel?, router: RouterProtocol, dataSource: TableViewDataSourceProtocol)
    func setupDetails()
//    func tap()
}

class CocktailDetailsViewPresenter: CocktailDetailsViewPresenterProtocol {
    weak var view: CocktailDetailsViewProtocol?
    var cocktail: CocktailModel?
    var router: RouterProtocol?
    var dataSource: TableViewDataSourceProtocol?
    
    required init(view: CocktailDetailsViewProtocol, cocktail: CocktailModel?, router: RouterProtocol, dataSource: TableViewDataSourceProtocol) {
        self.view = view
        self.cocktail = cocktail
        self.router = router
        self.dataSource = dataSource
    }
    
    public func setupDetails() {
        self.view?.setupDetails(with: cocktail, with: dataSource)
    }
    
//    func tap() {
//        router?.popToRoot()
//    }
}
