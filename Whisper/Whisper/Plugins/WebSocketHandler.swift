//
//  WebSocketHandler.swift
//  Whisper
//
//  Created by Lucy Borthwick on 13/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import Starscream

class WebSocketHandler {
    
    private static let _instance = WebSocketHandler();
    
    static var Instance: WebSocketHandler {
        return _instance;
    }
    
}
