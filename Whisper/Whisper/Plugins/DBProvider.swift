//
//  DBProvider.swift
//  Whisper
//
//  Created by Lucy Borthwick on 07/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage

protocol FetchData: class {
    func dataReceived(conversations: [Conversation]);
}

class DBProvider {
    
    private static let _instance = DBProvider();
    
    weak var delegate: FetchData?;
    
    private init() {
    }
    
    static var Instance: DBProvider {
        return _instance;
    }
    
    var dbRef: DatabaseReference {
        return Database.database().reference();
    }
    
    func returnDBRef() {
        var dbRef: DatabaseReference {
            return Database.database().reference();
        }
    }
    
    var conversationsRef: DatabaseReference {
        return dbRef.child(Constants.CONVERSATIONS);
    }
    
    var messagesRef: DatabaseReference {
        return dbRef.child(Constants.MESSAGES);
    }
    
    var storageRef: StorageReference {
        return  Storage.storage().reference(forURL: "gs://whisper-afaf1.appspot.com");
    }
    
    func saveUser(withID: String, email: String, password: String) {
        let data: Dictionary<String, Any> = [Constants.EMAIL: email, Constants.PASSWORD: password];
        
        conversationsRef.child(withID).setValue(data);
    }
    
    func getConversations() {
        conversationsRef.observeSingleEvent(of: DataEventType.value){
            (snapshot: DataSnapshot) in
            var conversations = [Conversation]();
            
            if let myConversations = snapshot.value as? NSDictionary {
                
                for (key, value) in myConversations {
                    
                    if let conversationData = value as? NSDictionary {
                        
                        if let email = conversationData[Constants.EMAIL] as? String {
                            let id = key as! String;
                            let newConversation = Conversation(id: id, name: email);
                            if email != AuthProvider.Instance.userEmail() {
                                conversations.append(newConversation);
                            }
                        }
                    }
                }
            }
            self.delegate?.dataReceived(conversations: conversations);
        }
    } //display conversations method
} //class

