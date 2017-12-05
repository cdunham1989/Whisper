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
    
    typealias Codable = Decodable & Encodable
    
    var text: String
    var jsonS: String
    
    init() {
        text = ""
        jsonS = ""
    }
    
    func inputText(input: String) {
        text += input
    }
    
    struct Message: Codable {
        var text : String
    }
    
    func toJson() {
        let upMessage = Message(text: self.text)
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(upMessage)
            let jsonString = String(data: jsonData, encoding: .utf8)
            jsonS = jsonString!
        }
        catch {
        }
    }
    
//    func toJson() {
//        var array = [String]()
//        array.insert("message", at: 0)
//        array.insert(text, at: 1)
//        let jsonEncoder = JSONEncoder()
//        do {
//            let jsonData = try jsonEncoder.encode(array)
//            let jsonString = String(data: jsonData, encoding: .utf8)
//            print("JSON String : " + jsonString!)
//        }
//        catch {
//        }
//        jsonString = "{ " + array[0] + ":" + array[1] + " }"
//
//    }
    
    
}
