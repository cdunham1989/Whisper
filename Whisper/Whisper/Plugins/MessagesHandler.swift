//
//  MessagesHandler.swift
//  Whisper
//
//  Created by Chris Dunham on 08/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation

class MessagesHandler {
    private static let _instance = MessagesHandler();
    private init() {}
    
    static var Instance: MessagesHandler {
        return _instance;
    }
    
    func sendMessage(senderID: String, senderName: String, text: String) {
        let data: Dictionary<String, Any> = [Constants.SENDER_ID: senderID, Constants.SENDER_NAME: senderName, Constants.TEXT: text];
        
        DBProvider.Instance.messagesRef.childByAutoId().setValue(data);
        
        
        
    }
    
    
} //class
