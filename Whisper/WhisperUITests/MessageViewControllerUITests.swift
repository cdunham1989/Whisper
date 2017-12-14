//
//  MessageViewControllerUITests.swift
//  WhisperUITests
//
//  Created by Chris Dunham on 14/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest

class MessageViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testkeep@whisper.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("password")
        app.buttons["Log in"].tap()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCorrectMessageViewOpens() {
        let cell = app.tables.cells.staticTexts["paul"]
        cell.tap()
        XCTAssert(app.staticTexts["paul"].exists)
    }
    
    func testBackButtonVisible() {
        let cell = app.tables.cells.staticTexts["paul"]
        cell.tap()
        XCTAssert(app.buttons["Back"].exists)
    }
    
    func testBackButtonWorks() {
        let cell = app.tables.cells.staticTexts["paul"]
        cell.tap()
        app.buttons["Back"].tap()
        XCTAssert(app.buttons["Logout"].exists)
    }
    
    
}
