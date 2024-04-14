//
//  ContentView.swift
//  DisplayListAsyncAwaitWithProtocol
//
//  Created by Norbert Grover on 4/6/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel:ContentViewModel
    @State var inputText = ""
    var body: some View {
        VStack {
            TextField("Enter somthing", text: $inputText, onCommit: {
                Task {
                    try? await viewModel.retriveDataForList(str: inputText)
                }
            })
            .accessibilityIdentifier("inputTextField")
            .autocorrectionDisabled(true)
            .autocapitalization(.none)
        }
        .padding()
        .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
        List(viewModel.wordList, id:\.self) { item in
            Text(item)
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
