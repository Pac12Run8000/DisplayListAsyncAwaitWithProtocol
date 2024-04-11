@testable import DisplayListAsyncAwaitWithProtocol
import XCTest

final class ContentViewModelTests: XCTestCase {
    var viewModel: ContentViewModel!
    var mockService: MockNetworkingService!

    override func setUp() {
        super.setUp()
        mockService = MockNetworkingService()
        viewModel = ContentViewModel(service: mockService)
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    
    
    func testRetrieveDataForList_NoStringParameter() async {
        let input = ""
        do {
            try await viewModel.retriveDataForList(str: input)
                XCTFail("Expected retrieveDataForList to throw an error for empty input, but it did not.")
            } catch let error as CustomErrors {
                XCTAssertEqual(error, CustomErrors.noURLCreated)
            } catch {
                XCTFail("Unexpected error type: \(error)")
            }
    }


    

}
