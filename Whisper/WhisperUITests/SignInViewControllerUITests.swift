//
//  MessageViewControllerUITests.swift
//  WhisperUITests
//
//  Created by Lucy Borthwick on 06/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest

class SignInViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        
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

}
