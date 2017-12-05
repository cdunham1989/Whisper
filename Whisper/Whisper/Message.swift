//
//  Message.swift
//  Whisper
//
//  Created by Lucy Borthwick on 05/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
//import RealmSwift

class Message {
    
    var text: String
    var jsonString: String
    
    init() {
        text = ""
        jsonString = ""
    }
    
    func inputText(input: String) {
        text += input
    }
    
    func toJson() {
        var array = [String]()
        array.insert("message", at: 0)
        array.insert(text, at: 1)
        jsonString = "{ " + array[0] + ":" + array[1] + " }"
    }
    
}
