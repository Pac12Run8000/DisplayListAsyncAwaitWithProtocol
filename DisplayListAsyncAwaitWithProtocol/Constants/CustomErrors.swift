import Foundation

enum CustomErrors:Error {
    case badURL
    case cannotParseListOfStrings
    case emptyObject
    case noStringParameterPassed
    case noURLCreated
    case noArrayOfStrings
    case noData
    case cannotDecode
}

extension CustomErrors:CustomStringConvertible {
    var description: String {
        switch self {
        case .badURL:
            return "This is a malformed URL"
        case .cannotParseListOfStrings:
            return "This custom object cannot produce list of strings"
        case .emptyObject:
            return "There is no data in object"
        case .noStringParameterPassed:
            return "there is no string acronym"
        case .noURLCreated:
            return "Couldn't create a URL"
        case .noArrayOfStrings:
            return "Couldn\'t generate array of strings"
        case .noData:
            return "There is no data"
        case .cannotDecode:
            return "Error decoding data"
        }
    }
    
    
}
