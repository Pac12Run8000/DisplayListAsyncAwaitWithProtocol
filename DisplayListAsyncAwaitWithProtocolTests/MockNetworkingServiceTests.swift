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

    func testRetrieveData() async throws {
    let url = try XCTUnwrap(URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=Sd"))
        let wordList = try await sut.retrieveData(url: url)
        XCTAssertFalse(wordList.isEmpty, "WordList should not be empty")
    }
    

    func testRetrieveDataNoData() async throws {
        let invalidURL = try XCTUnwrap(URL(string: "http://www.nactem.ac.uk/software/acromine/dictionary.py?sf="))
        do {
            _ = try await self.sut.retrieveData(url: invalidURL)
            XCTFail("Expected retrieveData to throw, but it did not.")
        } catch {
    
        }
    }
    

}
