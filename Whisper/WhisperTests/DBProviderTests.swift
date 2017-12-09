//
//  DBProviderTests.swift
//  WhisperTests
//
//  Created by Lucy Borthwick on 07/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import XCTest
@testable import Whisper

class DBProviderTests: XCTestCase {
    
    var db : DBProvider!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testReturnValueOfDBRef() {
        XCTAssertEqual(db.returnDBRef, "https://whisper-afaf1.firebaseio.com/")
    }
}
