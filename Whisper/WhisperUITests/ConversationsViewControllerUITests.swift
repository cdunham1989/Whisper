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
        XCUIApplication().launch()
        
        app.textFields["Email"].tap()
        app.textFields["Email"].typeText("testuser@whisper.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("testpassword")
        app.buttons["Signup"].tap()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    
}

