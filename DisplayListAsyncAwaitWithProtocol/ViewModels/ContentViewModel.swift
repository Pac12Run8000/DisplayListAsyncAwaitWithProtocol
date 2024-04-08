import Foundation

class ContentViewModel:ObservableObject {
    @Published public var wordList = [String]()
    
    var networkingService: NetworkingServiceProtocol
    
    init(service: NetworkingServiceProtocol = NetworkingService.shared) {
        self.networkingService = service
    }
    
    @MainActor
    public func retriveDataForList(str:String) async throws {
        guard let str = str as? String else {
            throw CustomErrors.noStringParameterPassed
        }
        guard let url = BuildURLConstants.urlForService(str: str) as? URL else {
            throw CustomErrors.noURLCreated
        }
        guard let list = try await networkingService.retrieveData(url: url) as? [String] else {
            throw CustomErrors.noArrayOfStrings
        }
        self.wordList = list
    }
}
