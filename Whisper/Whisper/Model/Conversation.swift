//
//  Conversation.swift
//  Whisper
//
//  Created by Lucy Borthwick on 08/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation

class Conversation {
    
    private var _name = "";
    private var _id = "";
    
    init(ud: String, name: String) {
        _id = id;
        _name = name;
    }
    
    var name: String {
        return _name;
    }
    
    var id: String {
        return _id;
    }
    
}
