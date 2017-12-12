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


@IBAction func encyptPressed(_ sender: Any) {   //ibaction action needs to link sign up button
    let input = stringToEn.text  /// strgin input needs to become password string inpout
    let key = keyEn.text  /// eventually key needs to be hardcoded and hidden in gitignore
    let iv = "gqLOHUioQ0QjhuvI"  // eventually key needs to be hardcoded and hidden in gitignore
    let en = try! input!.aesEncrypt(key!, iv: iv)
    outputEn.text = en
    
    
}
@IBAction func descyptPressed(_ sender: Any) {   // dont need right now
    let input = stringToDes.text
    let key = keyDes.text
    let iv = "gqLOHUioQ0QjhuvI"
    let des = try! input!.aesDecrypt(key!, iv: iv)
    outputDes.text = des
    
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
