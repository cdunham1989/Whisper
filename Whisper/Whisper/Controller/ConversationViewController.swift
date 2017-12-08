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

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var conversationsTableView: UITableView!
    
    private let CELL_ID = "Cell";
    
    private var conversations = [Conversation]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversations.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath);
        
        cell.textLabel?.text = "This works"
        
        return cell;
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        if AuthProvider.Instance.logOut() {
            dismiss(animated: true, completion: nil);
        }
    }
    
    @IBAction func newMessage(_ sender: Any) {
    }
}
 //class

