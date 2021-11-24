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
                ImageCellBuilder(height: UIScreen.main.bounds.width, cocktail: model)
            ], tableView: tableView),
        
            SimpleHeaderSection(
                title: CellType.ingredients.description,
                builders: [
                    IngredientCellBuilder(height: 150.0, cocktail: model),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: CellType.instructions.description,
                builders: [
                    TableCellBuilder(height: 150.0, cocktail: model, cellType: .instructions),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: CellType.category.description,
                builders: [
                    TableCellBuilder(height: 50.0, cocktail: model, cellType: .category),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: CellType.type.description,
                builders: [
                    TableCellBuilder(height: 50.0, cocktail: model, cellType: .type),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: CellType.glass.description,
                builders: [
                    TableCellBuilder(height: 50.0, cocktail: model, cellType: .glass),
                ], tableView: tableView)
        ]
    }
}
