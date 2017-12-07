//
//  DBProvider.swift
//  Whisper
//
//  Created by Lucy Borthwick on 07/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBProvider {
    
    private static let _instance = DBProvider();
    
    private init() {
        
    }
    
    static var Instance: DBProvider {
        return _instance;
    }
}
