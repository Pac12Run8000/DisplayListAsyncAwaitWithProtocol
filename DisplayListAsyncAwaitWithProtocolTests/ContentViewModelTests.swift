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

    

}
