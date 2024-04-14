//
//  ContentViewIUTest.swift
//  DisplayListAsyncAwaitWithUIProtocolTests
//
//  Created by Norbert Grover on 4/14/24.
//

import XCTest

class ContentViewUITests: XCTestCase {
    
    override func setUpWithError() throws {
           continueAfterFailure = false
           let app = XCUIApplication()
           app.launch()
       }

       func testTextFieldInput() {
           let app = XCUIApplication()
           let textField = app.textFields["inputTextField"]
           XCTAssertTrue(textField.exists, "The text field should be present on the screen.")
           textField.tap()
           textField.typeText("ar")
       }
}
