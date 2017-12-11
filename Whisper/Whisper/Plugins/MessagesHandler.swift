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
    func messageReceived(senderId: String, senderName: String, receiverName: String, text: String);
}

class MessagesHandler {
    private static let _instance = MessagesHandler();
    private init() {}
    
    weak var delegate: MessageReceivedDelegate?;
    
    static var Instance: MessagesHandler {
        return _instance;
    }
//
//    func sendMessage(senderId: String, senderName: String, text: String) {
//        let data: Dictionary<String, Any> = [Constants.SENDER_ID: senderId, Constants.SENDER_NAME: senderName, Constants.TEXT: text];
//
//        DBProvider.Instance.messagesRef.childByAutoId().setValue(data);
//    }
    
    func observeMessages() {
        DBProvider.Instance.messagesRef.observe(DataEventType.childAdded) {
            (snapshot: DataSnapshot) in
            if let data = snapshot.value as? NSDictionary {
                if let senderID = data[Constants.SENDER_ID] as? String {
                    if let senderName = data[Constants.SENDER_NAME] as? String {
                        if let text = data[Constants.TEXT] as? String {
                            if let receiverName = data[Constants.RECEIVER_NAME] as? String {
                                self.delegate?.messageReceived(senderId: senderID, senderName: senderName, receiverName: receiverName, text: text);
                            }
                        }
                    }
                }
            }
        }
    } //observe messages -- at the moment every single message sent reloads into a new conversation. ie. a conversation between person 1 and person 2 will appear when person 3 starts a new conversation with person 4. need to fix this. 
    
    
} //class
