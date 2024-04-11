@testable import DisplayListAsyncAwaitWithProtocol
import XCTest

final class MockNetworkingServiceTests: XCTestCase {
    var sut: MockNetworkingService!

    override func setUpWithError() throws {
        sut = MockNetworkingService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testRetrieveDataReturnsArray() async throws {
        let testURL = URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=sd")!
        do {
                let result = try await sut.retrieveData(url: testURL)
                XCTAssertFalse(result.isEmpty, "The result should not be empty")
                XCTAssertTrue(result.contains("X organ"), "The result should contain 'expectedItem'")
            } catch {
                XCTFail("An unexpected error occurred: \(error)")
            }
    }
    

    
    

}
