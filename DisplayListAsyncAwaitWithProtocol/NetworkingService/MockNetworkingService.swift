import Foundation

final class MockNetworkingService: NetworkingServiceProtocol {
    var mockWordList: [String]? = []
    var shouldThrowError:CustomErrors?
   
    func retrieveData(url: URL) async throws -> [String] {
        if let error = shouldThrowError {
            throw error
        }
        guard url != URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=") else {
            throw CustomErrors.badURL
        }
        if let wordList = mockWordList {
            return wordList
        }
        guard let url = try Bundle.main.url(forResource: "JsonResponse", withExtension: "geojson"), let data = try Data(contentsOf: url) as? Data else {
            throw CustomErrors.noData
        }
       
        guard let acronymList = try JSONDecoder().decode(AcronymList.self, from: data) as? AcronymList else {
            throw CustomErrors.cannotDecode
        }
        
        guard !acronymList.isEmpty else {
            throw CustomErrors.emptyObject
        }
        var wordList = [String]()
        for item in acronymList[0].lfs {
            wordList.append(item.lf)
        }
        return wordList
    }
}
