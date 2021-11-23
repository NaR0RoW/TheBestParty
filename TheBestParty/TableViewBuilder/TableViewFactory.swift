import UIKit

class TableViewFactory: FactoryProtocol {
    private let model: CocktailModel
    private let tableView: UITableView
    
    init(model: CocktailModel, tableView: UITableView) {
        self.model = model
        self.tableView = tableView
    }
    
    func getSections() -> [TableViewSectionBuilder] {
        return [
            SimpleHeaderSection(
                title: "Dados do pagador",
                builders: [
                    ImageCellBuilder(height: UIScreen.main.bounds.width, image: UIImage(systemName: "person.fill")!, cocktail: model
                    ),
                ], tableView: tableView),
            SimpleHeaderSection(
                title: "Hey",
                builders: [
                    IngredientCellBuilder(height: 150, cocktail: model
                    ),
                ], tableView: tableView),
        ]
    }
}
