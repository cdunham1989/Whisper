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
    
    let key = Key()

    func encryptPressed(password: String) {
        let input = password
        let key = self.key
        let iv = "gqLOHUioQ0QjhuvI"
        let en = try! input!.aesEncrypt(key!, iv: iv)
        return en
    }
    
    func descryptPressed(password: String) {
        let input = password
        let key = self.key
        let iv = "gqLOHUioQ0QjhuvI"
        let des = try! input!.aesDecrypt(key!, iv: iv)
        return des
    
    }

}
    
extension String{
    func aesEncrypt(_ key: String, iv: String) throws -> String {
        let data = self.data(using: .utf8)!
        let encrypted = try! AES(key: key, iv: iv, blockMode: .CBC, padding: PKCS7()).encrypt([UInt8](data))
        let encryptedData = Data(encrypted)
        return encryptedData.base64EncodedString()
    }
    
    func aesDecrypt(_ key: String, iv: String) throws -> String {
        let data = Data(base64Encoded: self)!
        let decrypted = try! AES(key: key, iv: iv, blockMode: .CBC, padding: PKCS7()).decrypt([UInt8](data))
        let decryptedData = Data(decrypted)
        return String(bytes: decryptedData.bytes, encoding: .utf8) ?? "Could not decrypt"
        
    }
}
    

