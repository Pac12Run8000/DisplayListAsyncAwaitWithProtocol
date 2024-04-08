import Foundation

protocol NetworkingServiceProtocol {
    func retrieveData(url: URL) async throws -> [String]
}
