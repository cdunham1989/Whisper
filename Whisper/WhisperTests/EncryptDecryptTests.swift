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
    let handler = JSONHandler();
    
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
    
    func testEncryptMessage() {
        let text = "Hello"
        let encryptedMessage = encrypt.encryptPressed(password: text)
        let encryptedJson = handler.convertToJSON(messageSenderName: "Lucy", messageReceiverName: "Hugo", messageText: encryptedMessage, messageError: false)
        let jsonOutput = "{\"senderName\":\"Lucy\",\"receiverName\":\"Hugo\",\"error\":false,\"text\":\"Hello\"}"
        XCTAssertFalse(encryptedJson == jsonOutput)
    }
    
    func testDecryptMessage() {
        let text = "Hello"
        let encryptedMessage = encrypt.encryptPressed(password: text)
        let decryptedMessage = encrypt.decryptPressed(messageBody: encryptedMessage)
        XCTAssertEqual(text, decryptedMessage)
    }
}
