//
//  MessagesHandler.swift
//  Whisper
//
//  Created by Chris Dunham on 08/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol MessageReceivedDelegate: class {
    func messageReceived(senderID: String, senderName: String, text: String);
}

class MessagesHandler {
    private static let _instance = MessagesHandler();
    private init() {}
    
    weak var delegate: MessageReceivedDelegate?;
    
    static var Instance: MessagesHandler {
        return _instance;
    }
    
    func sendMessage(senderID: String, senderName: String, text: String) {
        let data: Dictionary<String, Any> = [Constants.SENDER_ID: senderID, Constants.SENDER_NAME: senderName, Constants.TEXT: text];
        
        DBProvider.Instance.messagesRef.childByAutoId().setValue(data);
    }
    
    func observeMessages() {
        DBProvider.Instance.messagesRef.observe(DataEventType.childAdded) {
            (snapshot: DataSnapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let senderID = data[Constants.SENDER_ID] as? String {
                    if let senderName = data[Constants.SENDER_NAME] as? String {
                        if let text = data[Constants.TEXT] as? String {
                            self.delegate?.messageReceived(senderID: senderID, senderName: senderName, text: text);
                        }
                    }
                }
            }
        }
    }
    
    
} //class
