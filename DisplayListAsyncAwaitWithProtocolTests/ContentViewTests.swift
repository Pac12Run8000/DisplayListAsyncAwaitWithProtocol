@testable import DisplayListAsyncAwaitWithProtocol
import XCTest
import SwiftUI



class ContentViewTests: XCTestCase {
    var contentView: ContentView!
    var viewModel: ContentViewModel!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        viewModel = ContentViewModel(service: MockNetworkingService())
        
        contentView = ContentView().environmentObject(viewModel) as? ContentView
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window.isHidden = false
        let host = UIHostingController(rootView: contentView)
        window.rootViewController = host
        
        host.view.layoutIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        contentView = nil
        viewModel = nil
        window = nil
    }

    func testContentViewUpdatesWhenWordListChanges() async {
        try? await viewModel.retriveDataForList(str: "ax")
        
        XCTAssertNotNil(viewModel.wordList)
        
    }
}
