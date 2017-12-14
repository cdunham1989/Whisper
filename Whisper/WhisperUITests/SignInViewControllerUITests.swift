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
        XCTAssert(app.alerts["Username and password are required"].exists)
    }

    func testSignUpWithOnlyPassword() {
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("testpassword")
        app.buttons["Sign up"].tap()
        XCTAssert(app.alerts["Username and password are required"].exists)
    }

    func testSignUpWithNoUsernameOrPassword() {
        app.buttons["Sign up"].tap()
        XCTAssert(app.alerts["Username and password are required"].exists)
    }

    func testLoginWithOnlyUsername() {
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testuser@whisper.com")
        app.buttons["Log in"].tap()
        XCTAssert(app.alerts["Username and password are required"].exists)
    }
    
    func testLoginWithOnlyPassword() {
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("testpassword")
        app.buttons["Log in"].tap()
        XCTAssert(app.alerts["Username and password are required"].exists)
    }
    
    func testLoginWithNoUsernameOrPassword() {
        app.buttons["Log in"].tap()
        XCTAssert(app.alerts["Username and password are required"].exists)
    }
    
    func testLoginWithIncorrectUsername() {
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testuser@whispr.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("testpassword")
        app.buttons["Log in"].tap()
        XCTAssert(app.alerts["Problem with authentication"].exists)
    }

    func testLoginWithIncorrectPassword() {
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testuser@whisper.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("testpasword")
        app.buttons["Log in"].tap()
        XCTAssert(app.alerts["Problem with authentication"].exists)
    }
    
    func testLoginWithPasswordLessThanSixCharacters() {
        app.textFields["Username"].tap()
        app.textFields["Username"].typeText("testuser@whisper.com")
        app.secureTextFields["Password"].tap()
        app.secureTextFields["Password"].typeText("testp")
        app.buttons["Sign up"].tap()
        XCTAssert(app.alerts["Password too short"].exists)
    }
}
