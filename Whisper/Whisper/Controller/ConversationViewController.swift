//
//  ConversationViewController.swift
//  Whisper
//
//  Created by Lucy Borthwick on 07/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase 

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FetchData {
    
    @IBOutlet weak var conversationsTableView: UITableView!
    
    private let CELL_ID = "Cell";
    private let MESSAGE_SEGUE = "MessageSegue";
    
    private var conversations = [Conversation]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DBProvider.Instance.delegate = self;
        
        DBProvider.Instance.getConversations();
    }
    
    func dataReceived(conversations: [Conversation]) {
        self.conversations = conversations;
        
        for conversation in conversations {
            if conversation.id == AuthProvider.Instance.userID() {
                AuthProvider.Instance.userName = conversation.name;
            }
        }
        
        conversationsTableView.reloadData();
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath);
        
        cell.textLabel?.text = conversations[indexPath.row].name;
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: MESSAGE_SEGUE, sender: nil);
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        if AuthProvider.Instance.logOut() {
            dismiss(animated: true, completion: nil);
        }
    }

}
 //class

