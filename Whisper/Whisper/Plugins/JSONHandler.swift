//
//  JSONHandler.swift
//  Whisper
//
//  Created by Hugo Sykes on 13/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation

class JSONHandler {
    
    private static let _instance = JSONHandler();
    
    static var Instance: JSONHandler {
        return _instance;
    }
    
    func convertToJSON(messageSenderName: String, messageReceiverName: String, messageText: String, messageError: Bool) -> String {
        var jsonString = "";
        struct Message: Codable {
            var senderName: String;
            var receiverName: String;
            var text: String;
            var error: Bool;
        }
        let message = Message(senderName: messageSenderName, receiverName: messageReceiverName, text: messageText, error: messageError)
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(message)
            jsonString = String(data: jsonData, encoding: .utf8)!
        }
        catch {
        }
        return jsonString
    }
    
}
