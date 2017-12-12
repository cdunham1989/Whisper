//
//  MessageViewController.swift
//  Whisper
//
//  Created by Lucy Borthwick on 08/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import Starscream

class MessageViewController: JSQMessagesViewController, MessageReceivedDelegate, WebSocketDelegate {
    
    private var messages = [JSQMessage]();
    
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.black)
    }()
    
    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.black)
    }()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var receiverName = "";
    
    var socket = WebSocket(url: URL(string: "ws://whisper-server2017.herokuapp.com/")!)

    override func viewDidLoad() {
        super.viewDidLoad();
        socket.delegate = self;
        socket.connect();
        
        self.senderId = AuthProvider.Instance.userID();
        self.senderDisplayName = AuthProvider.Instance.userEmailStripped();
        receiverName = appDelegate.myReceiverInstance.getReceiverName();
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero;
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero;
        collectionView.backgroundColor = UIColor.black;
        collectionView.collectionViewLayout.messageBubbleFont = UIFont.init(name: "Courier", size: 22);
        
        MessagesHandler.Instance.observeMessages();
        MessagesHandler.Instance.delegate = self;
        
        self.navigationItem.title = receiverName
    }
    
    // web socket functions
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
        socket.write(string: JSQToJson(messageSenderName: senderDisplayName, messageReceiverName: "", messageText: "", messageError: false))
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(String(describing: error?.localizedDescription))")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        persistJSON(msg: text);
        print("got some text: \(text)")
        collectionView.reloadData();
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
        let data: Dictionary<String, Any> = [Constants.SENDER_ID: senderId, Constants.SENDER_NAME: parsedJSON!.senderName, Constants.RECEIVER_NAME: parsedJSON!.receiverName, Constants.TEXT: parsedJSON!.text];
        if (parsedJSON?.text != "") { DBProvider.Instance.messagesRef.childByAutoId().setValue(data) }
    }
    // end of web socket functions
    
    
    // COLLECTION VIEW FUNCTIONS
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        return messages[indexPath.item].senderId == senderId ? outgoingBubble : incomingBubble
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, attributedTextForMessageBubbleTopLabelAt indexPath: IndexPath!) -> NSAttributedString! {
        return messages[indexPath.item].senderId == senderId ? nil : NSAttributedString(string: messages[indexPath.item].senderDisplayName)
    } // display username above message youve received
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return messages[indexPath.item].senderId == senderId ? 0 : 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        return cell;
    }
    
    // END COLLECTION VIEW FUNCTIONS
    
    func messageReceived(senderId: String, senderName: String, receiverName: String, text: String) {
        if ((senderName == senderDisplayName) && (receiverName == self.receiverName)) || ((senderName == self.receiverName) && (receiverName == senderDisplayName)) {
            messages.append(JSQMessage(senderId: senderId, displayName: senderName, text: text))
        }
        collectionView.reloadData();
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        collectionView.reloadData();
//        MessagesHandler.Instance.sendMessage(senderId: senderId,senderName: senderDisplayName, text: text);
        socket.write(string: JSQToJson(messageSenderName: senderDisplayName, messageReceiverName: receiverName, messageText: text, messageError: false));
        finishSendingMessage();
    }
    
    func JSQToJson(messageSenderName: String, messageReceiverName: String, messageText: String, messageError: Bool) -> String {
        var jsonString = "";
        struct Message: Codable {
            var senderName: String;
            var receiverName: String;
            var text: String;
            var error: Bool;
        }
        let message = Message(senderName: messageSenderName, receiverName: messageReceiverName, text: messageText, error: messageError)
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(message)
            jsonString = String(data: jsonData, encoding: .utf8)!
        }
        catch {
        }
        return jsonString
    }
    
    deinit {
        socket.disconnect(forceTimeout: 0)
        socket.delegate = nil
    }
    
    @IBAction func backToConversations(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
}
