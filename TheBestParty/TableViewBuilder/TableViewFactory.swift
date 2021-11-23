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
                title: "Image",
                builders: [
                    ImageCellBuilder(height: UIScreen.main.bounds.width, image: UIImage(systemName: "person.fill")!, cocktail: model),
                ], tableView: tableView),
        
            SimpleHeaderSection(
                title: "Ingredients",
                builders: [
                    IngredientCellBuilder(height: 150, cocktail: model),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: "instructions",
                builders: [
                    TableCellBuilder(height: 150, cocktail: model, cellType: .instructions),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: "category",
                builders: [
                    TableCellBuilder(height: 150, cocktail: model, cellType: .category),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: "type",
                builders: [
                    TableCellBuilder(height: 150, cocktail: model, cellType: .type),
                ], tableView: tableView),
            
            SimpleHeaderSection(
                title: "glass",
                builders: [
                    TableCellBuilder(height: 150, cocktail: model, cellType: .glass),
                ], tableView: tableView)
        ]
    }
}

enum CellType {
    case instructions
    case category
    case type
    case glass
}
