//
//  DisplayListAsyncAwaitWithProtocolApp.swift
//  DisplayListAsyncAwaitWithProtocol
//
//  Created by Norbert Grover on 4/6/24.
//

import SwiftUI

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
