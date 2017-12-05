//
//  MessageTests.swift
//  WhisperTests
//
//  Created by Chris Dunham on 05/12/2017.
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
    
    func testMessageInstantiation() {
        
       
    }
}
