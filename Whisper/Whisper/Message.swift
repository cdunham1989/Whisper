//
//  Message.swift
//  Whisper
//
//  Created by Lucy Borthwick on 06/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation

class Message {
    
    var text: String
    var jsonS: String
    
    init() {
        text = ""
        jsonS = ""
    }
    
    func inputText(input: String) {
        text += input
    }
    
    func sendText() {
        self.toJson()
    }
    
    func toJson() {
        struct Message: Codable {
            var text : String
        }
        
        let message = Message(text: self.text)
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(message)
            let jsonString = String(data: jsonData, encoding: .utf8)
            jsonS = jsonString!
        }
        catch {
        }
    }
    
}
