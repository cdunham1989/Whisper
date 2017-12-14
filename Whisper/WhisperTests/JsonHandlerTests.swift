//
//  JsonHandlerTests.swift
//  WhisperTests
//
//  Created by Lucy Borthwick on 14/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest
@testable import Whisper

class JsonHandlerTests: XCTestCase {
    
    let handler = JSONHandler();
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConvertToJson() {
        let senderName = "Lucy"
        let receiverName = "Hugo"
        let text = "Hello"
        let error = false
        let result = handler.convertToJSON(messageSenderName: senderName, messageReceiverName: receiverName, messageText: text, messageError: error)
        let output = "{\"senderName\":\"Lucy\",\"receiverName\":\"Hugo\",\"error\":false,\"text\":\"Hello\"}"
        XCTAssertEqual(result, output)
    }
    
}
