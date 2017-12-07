//
//  SignInViewController.swift
//  Whisper
//
//  Created by Lucy Borthwick on 07/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let CONVERSATIONS_SEGUE = "ConversationsSegue";

    @IBOutlet weak var UsernameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LogIn(_ sender: Any) {
        performSegue(withIdentifier: CONVERSATIONS_SEGUE, sender: nil);
    }
    
    @IBAction func SignUp(_ sender: Any) {
    }
    
} // class



























