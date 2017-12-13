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
        
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testuser@whisper.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("testpassword")
        app.buttons["Signup"].tap()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
//    func testConversationsNavBarShows() {
//        XCTAssertTrue(app.staticTexts["Conversations"].exists)
//    }
//
//    func testConversationsNavBarButton() {
//        XCTAssertTrue(app.staticTexts["Logout"].exists)
//    }
}

