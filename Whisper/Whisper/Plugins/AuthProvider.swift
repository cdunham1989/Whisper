//
//  AuthProvider.swift
//  Whisper
//
//  Created by Lucy Borthwick on 07/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias LoginHandler = (_ msg: String?) -> Void;

struct LoginErrorCode {
    static let INVALID_USERNAME = "Please append '@whisper.com' to your username";
    static let USERNAME_IN_USE = "This username has already been assigned";
    static let WEAK_PASSWORD = "Please enter a password of at least 6 characters"
    static let WRONG_PASSWORD = "Error. Wrong password for this account"
    static let PROBLEM_CONNECTING = "Problem connecting, please try again later";
}

class AuthProvider {
    
    private static let _instance = AuthProvider();
    
    var cryptoswift = CryptoSwift()

    static var Instance: AuthProvider {
        return _instance;
    }
    
    var userName = "";
    
    func login(email: String, password: String, loginHandler: LoginHandler?) {
        /// check password matches hash
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    self.handleErrors(err: error! as NSError, loginHandler: loginHandler);
                } else {
                    loginHandler?(nil);
                }
        });
    } //login func
    
    func signUp(email: String, password: String, loginHandler: LoginHandler?) {
        /// encrypt password here
    
        let encryptedPassword = cryptoswift.encrypt(text: password)
        
        //
        Auth.auth().createUser(withEmail: email, password: encryptedPassword!, completion: { (user, error) in
            
            if error != nil {
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler);
            } else {
                if user?.uid != nil {
                    DBProvider.Instance.saveUser(withID: user!.uid, email: email, password: password);
                    self.login(email: email, password: encryptedPassword!, loginHandler: loginHandler)
                };
            }
        });
    } // sign up
    
    func isLoggedIn() -> Bool {
        if Auth.auth().currentUser != nil {
            return true;
        }
        return false;
    } //is logged in 
    
    
    func logOut() -> Bool {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut();
                return true;
            } catch {
                return false;
            }
        }
        return false;
    } //log out
    
    func userID() -> String {
        return Auth.auth().currentUser!.uid;
    }
    
    func userEmail() -> String {
        return Auth.auth().currentUser!.email!;
    }

    private func handleErrors(err: NSError, loginHandler: LoginHandler?) {
        
        if let errCode = AuthErrorCode(rawValue: err.code) {
            switch errCode {
                
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_USERNAME);
                break;
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.USERNAME_IN_USE);
                break;
            case .weakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD);
                break;
            case .wrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORD);
                break;
            default:
                loginHandler?(LoginErrorCode.PROBLEM_CONNECTING);
                break;
        }//error code
        }
    }
    
} //class
