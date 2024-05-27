import SwiftUI

// This is environment property injection

@main
struct DisplayListAsyncAwaitWithProtocolApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environmentObject(ContentViewModel())
                .environmentObject(ContentViewModel(service: MockNetworkingService()))
        }
    }
}
