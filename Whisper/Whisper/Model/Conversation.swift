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
    
    init(id: String, name: String) {
        _id = id;
        _name = name;
    }
    
    var name: String {
        return _name;
    }
    
    func nameStripper() -> String {
        let currentName = name
        let index = currentName.index(of: "@") ?? name.endIndex
        let prefix = currentName[..<index]
        return String(prefix)
    }
    
    var id: String {
        return _id;
    }
    
}
