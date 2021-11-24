import Foundation

enum CellType: CaseIterable {
    case ingredients
    case instructions
    case category
    case type
    case glass
    
    var description: String {
        switch self {
        case .ingredients:
            return "Ingredients"
        case .instructions:
            return "Instructions"
        case .category:
            return "Category"
        case .type:
            return "Type"
        case .glass:
            return "Glass"
        }
    }
}
