//
//  EncryptDecrypt.swift
//  Whisper
//
//  Created by Oliver Pople on 12/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import RNCryptor
import CryptoSwift


class EncryptDecrypt {
    
    private static let _instance = EncryptDecrypt();
    
    static var Instance: EncryptDecrypt {
        return _instance;
    }
    
    let keyClass = Key()
    
        func encryptPressed(password: String) -> String {
            let input = password
            let key = keyClass.key
            let iv = "gqLOHUioQ0QjhuvI"
            let en = try! input.aesEncrypt(key, iv: iv)
            return en
    }
    

}
    
extension String{
    func aesEncrypt(_ key: String, iv: String) throws -> String {
        var result = ""
        let keyClass = Key()
        do {
            
            let key: [UInt8] = Array(keyClass.key.utf8) as [UInt8]
            
            let aes = try! AES(key: key, blockMode: .ECB, padding: .pkcs7) //AES128 .ECB pkcs7
            let encrypted = try aes.encrypt(key)
            
            result = encrypted.toHexString()
            
        } catch {
            print(error)
        }
        
        return result
    }
}




    

