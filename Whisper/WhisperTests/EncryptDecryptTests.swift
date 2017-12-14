//
//  EncryptDecryptTests.swift
//  WhisperTests
//
//  Created by Lucy Borthwick on 14/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest
@testable import Whisper

class EncryptDecryptTests: XCTestCase {
    
    let encrypt = EncryptDecrypt();
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEncryptPassword() {
        let password = "123456"
        let encryptedPassword = encrypt.encryptPressed(password: password);
        XCTAssertFalse(password == encryptedPassword)
    }

    
}
