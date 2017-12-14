//
//  AuthProviderTests.swift
//  WhisperTests
//
//  Created by Lucy Borthwick on 14/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest
@testable import Whisper


typealias LoginHandler = (_ msg: String?) -> Void;

class AuthProviderTests: XCTestCase {
    
    let ap = AuthProvider();
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
//    
//    func testCurrentUser() {
//        _ = ap.signUp(email: "example@whisper.com", password: "123456", loginHandler: LoginHandler);
//        let userEmail = ap.userEmail();
//        XCTAssertEqual(userEmail, "example@whisper.com")
//    }
    
}
