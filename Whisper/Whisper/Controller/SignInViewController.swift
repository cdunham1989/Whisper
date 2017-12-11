//
//  SignInViewController.swift
//  Whisper
//
//  Created by Lucy Borthwick on 07/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {
    
    private let CONVERSATIONS_SEGUE = "ConversationsSegue";

    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    let rootRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AuthProvider.Instance.isLoggedIn() {
            self.performSegue(withIdentifier: self.CONVERSATIONS_SEGUE, sender: nil);
        }
    }

    @IBAction func LogIn(_ sender: Any) {
        
        if UsernameTextField.text != "" && PasswordTextField.text != "" {
            
            AuthProvider.Instance.login(email: UsernameTextField.text!, password: PasswordTextField.text!, loginHandler: { ( message) in
                    if message != nil {
                        self.alertTheUser(title: "Problem with authentication", message: message!);
                    } else {
                        self.UsernameTextField.text = "";
                        self.PasswordTextField.text = "";
                        self.performSegue(withIdentifier: self.CONVERSATIONS_SEGUE, sender: nil)
                    }
                })
                
            } else {
                alertTheUser(title: "Username is required", message: "Enter username in username field");
            }
    } //login func
    
    @IBAction func SignUp(_ sender: Any) {
        
        if UsernameTextField.text != "" && PasswordTextField.text != "" {
            
            AuthProvider.Instance.signUp(email: UsernameTextField.text!, password: PasswordTextField.text!, loginHandler: { ( message ) in
                
                if message != nil {
                    self.alertTheUser(title: "Problem creating the user", message: message!)
                } else {
                    self.UsernameTextField.text = "";
                    self.PasswordTextField.text = "";
                    self.performSegue(withIdentifier: self.CONVERSATIONS_SEGUE, sender: nil)
                }
            })
            
        } else {
            alertTheUser(title: "Email is required", message: "Enter email in email field");
        }
    }//sign up func
   
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }
    
} // class



























