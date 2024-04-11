import Foundation

final class MockNetworkingService: NetworkingServiceProtocol {
    
   
    func retrieveData(url: URL) async throws -> [String] {
        guard url != URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=") else {
            throw CustomErrors.badURL
        }
        
        var wordList = [String]()
        guard let url = try Bundle.main.url(forResource: "JsonResponse", withExtension: "geojson"), let data = try Data(contentsOf: url) as? Data else {
            throw CustomErrors.noData
        }
       
        guard let acronymList = try JSONDecoder().decode(AcronymList.self, from: data) as? AcronymList else {
            throw CustomErrors.cannotDecode
        }
        
        guard !acronymList.isEmpty else {
            throw CustomErrors.emptyObject
        }
        
        for item in acronymList[0].lfs {
            wordList.append(item.lf)
        }
        return wordList
    }
}
