//
//  MessageViewControllerUITests.swift
//  WhisperUITests
//
//  Created by Lucy Borthwick on 06/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest
//@testable import Whisper

class SignInViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSignInViewDisplayButtons() {
        XCTAssert(app.buttons["Sign up"].exists)
        XCTAssert(app.buttons["Log in"].exists)
    }
    
    func testSignInViewDisplayTextFields() {
        XCTAssert(app.textFields["Username"].exists)
        XCTAssert(app.secureTextFields["Password"].exists)
    }
    
    func testSignUpWithOnlyUsername() {
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testuser@whisper.com")
        app.buttons["Sign up"].tap()
        XCTAssertEqual(app.alerts.title, "Username and password are required")
    }
    
    func testSignUpWithOnlyPassword() {
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("testpassword")
        app.buttons["Sign up"].tap()
        XCTAssertEqual(app.alerts.title, "Username and password are required")
    }
    
    func testSignUpWithNoUsernameOrPassword() {
        app.buttons["Sign up"].tap()
        XCTAssertEqual(app.alerts.title, "Username and password are required")
    }
    
    func testLoginWithOnlyUsername() {
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testuser@whisper.com")
        app.buttons["Log in"].tap()
        XCTAssertEqual(app.alerts.title, "Username and password are required")
    }
    
    func testLoginWithOnlyPassword() {
        app.textFields["Password"].tap()
        app.textFields["Password"].typeText("testpassword")
        app.buttons["Log in"].tap()
        XCTAssertEqual(app.alerts.title, "Username and password are required")
    }
    
    func testLoginWithNoUsernameOrPassword() {
        app.buttons["Log in"].tap()
        XCTAssertEqual(app.alerts.title, "Username and password are required")
    }
    
    //login with incorrect username
    
    //login with incorrect password
    
    //signup with password < 6 characters
    
    //signup with username without @whisper.com
}
