//
//  ConversationsViewControllerUITests.swift
//  WhisperUITests
//
//  Created by Chris Dunham on 13/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest

class ConversationsViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLogoutButtonWorks() {
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testkeep@whisper.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("password")
        app.buttons["Log in"].tap()
        app.buttons["Logout"].tap()
        XCTAssert(app.buttons["Sign up"].exists)
    }

    func testConversationsLinkOpensChatThread() {
        let cell = app.tables.cells.staticTexts["paul"]

        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testkeep@whisper.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("password")
        app.buttons["Log in"].tap()
        cell.tap()
        XCTAssertTrue(app.staticTexts["paul"].exists)
  }
    
}

