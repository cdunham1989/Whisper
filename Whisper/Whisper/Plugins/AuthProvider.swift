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
    static let INVALID_EMAIL = "Invalid email address";
    static let EMAIL_IN_USE = "Email already in use";
    static let INVALID_CREDENTIAL = "Invalid credential";
    static let PROBLEM_CONNECTING = "Try again later";
}

class AuthProvider {
    
    private static let _instance = AuthProvider();

    static var Instance: AuthProvider {
        return _instance;
    }
    
    func login(email: String, password: String, loginHandler: LoginHandler?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    self.handleErrors(err: error! as NSError, loginHandler: loginHandler);
                } else {
                    loginHandler?(nil);
                }
        });
    } //login func
    
    func signUp(email: String, password: String, loginHandler: LoginHandler?) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler);
            } else {
                if user?.uid != nil {
                    DBProvider.Instance.saveUser(withID: user!.uid, email: email, password: password);
                    self.login(email: email, password: password, loginHandler: loginHandler)

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

    private func handleErrors(err: NSError, loginHandler: LoginHandler?) {
        
        if let errCode = AuthErrorCode(rawValue: err.code) {
            switch errCode {
                
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL);
                break;
            case .invalidCredential:
                loginHandler?(LoginErrorCode.INVALID_CREDENTIAL);
                break;
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_IN_USE);
                break;
                
            default:
                loginHandler?(LoginErrorCode.PROBLEM_CONNECTING);
                break;
        }//error code
        }
    }
} //class
