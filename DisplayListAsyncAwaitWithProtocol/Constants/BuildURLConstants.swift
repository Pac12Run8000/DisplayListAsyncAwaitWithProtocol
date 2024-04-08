import Foundation

struct BuildURLConstants {
    
    public static func urlForService(str:String) -> URL {
        let hostPath:String = "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="
        guard !str.isEmpty, let url = URL(string: hostPath + str) else {
         fatalError("Could not fetch URL")
        }
        return url
    }
}
