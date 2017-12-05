//
//  Message.swift
//  Whisper
//
//  Created by Chris Dunham on 05/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation

class Message {
    
    var text: String
    
    init() {
        text = ""
    }
    
    func inputText(input: String) {
        text += input
    }
    
}
