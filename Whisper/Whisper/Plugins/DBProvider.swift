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

class DBProvider {
    
    private static let _instance = DBProvider();
    
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
} //class
