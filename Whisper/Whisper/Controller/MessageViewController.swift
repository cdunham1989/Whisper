//
//  MessageViewController.swift
//  Whisper
//
//  Created by Lucy Borthwick on 08/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class MessageViewController: JSQMessagesViewController, MessageReceivedDelegate {
    
    private var messages = [JSQMessage]();
    
    lazy var outgoingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.outgoingMessagesBubbleImage(with: UIColor.black)
    }()
    
    lazy var incomingBubble: JSQMessagesBubbleImage = {
        return JSQMessagesBubbleImageFactory()!.incomingMessagesBubbleImage(with: UIColor.black)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        MessagesHandler.Instance.observeMessages();
        MessagesHandler.Instance.delegate = self;
        
        self.senderId = AuthProvider.Instance.userID()
        self.senderDisplayName = AuthProvider.Instance.userEmail();
        
        collectionView.collectionViewLayout.incomingAvatarViewSize = CGSize.zero
        collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSize.zero
        collectionView.backgroundColor = UIColor.black;
        collectionView.collectionViewLayout.messageBubbleFont = UIFont.init(name: "Courier", size: 22);
        
    }
    
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
    
    // delegation functions
    
    func messageReceived(senderId: String, senderName: String, text: String) {
        messages.append(JSQMessage(senderId: senderId, displayName: senderName, text: text))
        //collectionView.reloadData();
        // ^^ if we keep this line in it sends the message twice...but taking it out means the previous convo only loads after a new message is sent .... need to find a way to stop this.
    }
    
    // end delegation functions
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text));
        collectionView.reloadData();
        
        MessagesHandler.Instance.sendMessage(senderId: senderId,senderName: senderDisplayName, text: text);
        
        finishSendingMessage();
    }
    
    
    @IBAction func backToConversations(_ sender: Any) {
        dismiss(animated: true, completion: nil);
    }
    
}
