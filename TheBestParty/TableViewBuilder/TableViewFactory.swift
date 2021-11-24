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
            MockSection(builders: [
                ImageCellBuilder(cocktail: model)
            ], tableView: tableView),

            SimpleHeaderSection(
                title: CellType.ingredients.description,
                builders: [
                    IngredientCellBuilder(cocktail: model),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: CellType.instructions.description,
                builders: [
                    TableCellBuilder(cocktail: model, cellType: .instructions),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: CellType.category.description,
                builders: [
                    TableCellBuilder(cocktail: model, cellType: .category),
                ], tableView: tableView),

            SimpleHeaderSection(
                title: CellType.type.description,
                builders: [
                    TableCellBuilder(cocktail: model, cellType: .type),
                ], tableView: tableView),

            SimpleHeaderSection(
                title: CellType.glass.description,
                builders: [
                    TableCellBuilder(cocktail: model, cellType: .glass),
                ], tableView: tableView)
        ]
    }
}
