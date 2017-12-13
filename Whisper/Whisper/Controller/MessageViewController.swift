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

class MessageViewController: JSQMessagesViewController, MessageReceivedDelegate {
    
    private var messages = [JSQMessage]();
    
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.black)
    }()
    
    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.black)
    }()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var receiverName = "";
    var handle: UInt = 0;

    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.senderId = AuthProvider.Instance.userID();
        self.senderDisplayName = AuthProvider.Instance.userEmailStripped();
        receiverName = appDelegate.myReceiverInstance.getReceiverName();
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero;
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero;
        collectionView.backgroundColor = UIColor.black;
        collectionView.collectionViewLayout.messageBubbleFont = UIFont.init(name: "Courier", size: 22);
        
        handle = MessagesHandler.Instance.observeMessages();
        MessagesHandler.Instance.delegate = self;
        
        self.navigationItem.title = receiverName
    }

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
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, layout collectionViewLayout: JSQMessagesCollectionViewFlowLayout!, heightForMessageBubbleTopLabelAt indexPath: IndexPath!) -> CGFloat {
        return messages[indexPath.item].senderId == senderId ? 0 : 15
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        return cell;
    }

    func messageReceived(senderId: String, senderName: String, receiverName: String, text: String) {
        if ((senderName == senderDisplayName) && (receiverName == self.receiverName)) || ((senderName == self.receiverName) && (receiverName == senderDisplayName)) {
            let decryptedText = EncryptDecrypt.Instance.decryptPressed(messageBody: text)
            messages.append(JSQMessage(senderId: senderId, displayName: senderName, text: decryptedText))
        }
        collectionView.reloadData();
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        collectionView.reloadData();
        
        let encryptedText = EncryptDecrypt.Instance.encryptPressed(password: text!)

        WebSocketHandler.Instance.send(string: JSONHandler.Instance.convertToJSON(messageSenderName: senderDisplayName, messageReceiverName: receiverName, messageText: encryptedText, messageError: false));
        
        finishSendingMessage();
    }
    
    @IBAction func backToConversations(_ sender: Any) {
        DBProvider.Instance.messagesRef.removeObserver(withHandle: handle);
        dismiss(animated: true, completion: nil);
    }
}
