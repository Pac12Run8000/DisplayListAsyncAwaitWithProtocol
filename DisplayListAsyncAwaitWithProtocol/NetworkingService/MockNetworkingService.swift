import Foundation

final class MockNetworkingService: NetworkingServiceProtocol {
    var mockWordList: [String]? = nil
    var shouldThrowError:CustomErrors?
   
    func retrieveData(url: URL) async throws -> [String] {
        if let error = shouldThrowError {
            throw error
        }
        if let wordList = mockWordList {
            return wordList
        }
        

        guard let myUrl = try Bundle.main.url(forResource: "JsonResponse", withExtension: "geojson"), let data = try Data(contentsOf: myUrl) as? Data else {
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
