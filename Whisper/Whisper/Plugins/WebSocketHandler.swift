//
//  WebSocketHandler.swift
//  Whisper
//
//  Created by Lucy Borthwick on 13/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import Starscream

class WebSocketHandler: WebSocketDelegate {
    
    private static let _instance = WebSocketHandler();
    
    static var Instance: WebSocketHandler {
        return _instance;
    }
    
    var socket = WebSocket(url: URL(string: "ws://whisper-server2017.herokuapp.com/")!)
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var receiverName = "";
    
    func connect() {
        socket.delegate = self;
        socket.connect();
    }
    
    func send(string: String) {
        socket.write(string: string);
    }
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
        socket.write(string: JSONHandler.Instance.convertToJSON(messageSenderName: AuthProvider.Instance.userEmailStripped(), messageReceiverName: "", messageText: "", messageError: false))
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(String(describing: error?.localizedDescription))")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        persistJSON(msg: text);
        print("got some text: \(text)")
        //        collectionView.reloadData();
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("got some data: \(data.count)")
    }
    
    func persistJSON(msg: String) {
        struct ReceivedMessage: Codable {
            var senderName : String;
            var receiverName : String;
            var text : String;
            var error : Bool;
        }
        
        let decoder = JSONDecoder();
        let jsonData = msg.data(using: .utf8)!
        let parsedJSON = try? decoder.decode(ReceivedMessage.self, from: jsonData);
        let data: Dictionary<String, Any> = [Constants.SENDER_ID: AuthProvider.Instance.userID(), Constants.SENDER_NAME: parsedJSON!.senderName, Constants.RECEIVER_NAME: parsedJSON!.receiverName, Constants.TEXT: parsedJSON!.text];
        if (parsedJSON?.text != "") { DBProvider.Instance.messagesRef.childByAutoId().setValue(data) }
    }
    
}
