//
//  MessageTests.swift
//  WhisperTests
//
//  Created by Lucy Borthwick on 06/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest
@testable import Whisper

class MessageTests: XCTestCase {
    
    var message : Message!
    
    override func setUp() {
        super.setUp()
        message = Message()
    }
    
    override func tearDown() {
        message = nil
        super.tearDown()
    }
    
    func testCanInputText() {
        let _ = message.inputText(input: "Hello")
        XCTAssertTrue(message.text == "Hello")
    }
    
    func testConvertTextToJSON() {
        let _ = message.inputText(input: "Hello")
        let _ = message.toJson()
        print(message.jsonS)
        XCTAssertEqual(message.jsonS, "{\"text\":\"Hello\"}")
    }
    
    func testSendText() {
        let _ = message.inputText(input: "Hello")
        let _ = message.sendText()
        XCTAssertEqual(message.jsonS, "{\"text\":\"Hello\"}")
    }
}

