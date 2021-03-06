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

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func LogIn(_ sender: Any) {
        if UsernameTextField.text != "" && PasswordTextField.text != "" {
        let encryptedPassword = EncryptDecrypt.Instance.encryptPressed(password: PasswordTextField.text!)
            AuthProvider.Instance.login(email: UsernameTextField.text!, password: encryptedPassword, loginHandler: { ( message) in
                    if message != nil {
                        self.alertTheUser(title: "Problem with authentication", message: message!);
                    } else {
                        self.successfulSignIn();
                    }
                })
            } else {
                alertTheUser(title: "Username and password are required", message: "Please enter a valid username (...@whisper.com) and password (minimum 6 characters) in the respective fields");
            }
    }
    
    @IBAction func SignUp(_ sender: Any) {
        if UsernameTextField.text != "" && PasswordTextField.text != "" {
            if ((PasswordTextField.text?.count)! < 6) {
                alertTheUser(title: "Password too short", message: "Please enter a password of six characters or more");
            } else {
                let encryptedPassword = EncryptDecrypt.Instance.encryptPressed(password: PasswordTextField.text!)
                AuthProvider.Instance.signUp(email: UsernameTextField.text!, password: encryptedPassword, loginHandler: { ( message ) in
                    if message != nil {
                        self.alertTheUser(title: "Problem creating the user", message: message!)
                    } else {
                        self.successfulSignIn()
                    }
                });
            }
        } else {
            alertTheUser(title: "Username and password are required", message: "Please enter a valid username (...@whisper.com) and password (minimum 6 characters) in the respective fields");
        }
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }
    
    private func successfulSignIn() {
        self.UsernameTextField.text = "";
        self.PasswordTextField.text = "";
        self.performSegue(withIdentifier: self.CONVERSATIONS_SEGUE, sender: nil)
        WebSocketHandler.Instance.connect();
    }
}
