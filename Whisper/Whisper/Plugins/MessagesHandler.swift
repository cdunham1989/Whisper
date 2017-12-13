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

    func observeMessages() -> DatabaseHandle {
        return DBProvider.Instance.messagesRef.observe(DataEventType.childAdded) {
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
    }
    
}
