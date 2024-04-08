import Foundation

final class MockNetworkingService: NetworkingServiceProtocol {
    func retrieveData(url: URL) async throws -> [String] {
        return ["MockWord1", "MockWord2", "MockWord3"]
    }
}
