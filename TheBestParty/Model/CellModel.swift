import Foundation

public enum CellModel: CustomStringConvertible {
    case image
    case ingredients
    case instructions
    case category
    case cocktailType
    case glass
    
    public var description: String {
        switch self {
        case .image:
            return ""
        case .ingredients:
            return "Ingredients"
        case .instructions:
            return "Instructions"
        case .category:
            return "Category"
        case .cocktailType:
            return "Type of drink"
        case .glass:
            return "Glass"
        }
    }
}
