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
    
//    func descryptPressed(password: String) -> String {
//        let input = password
//        let key = keyClass.key
//        let iv = "gqLOHUioQ0QjhuvI"
//        let des = try! input.aesDecrypt(key, iv: iv)
//        return des
//
//    }

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

//
//    func aesDecrypt() {
//        var result = ""
//        let keyClass = Key()
//        do {
//
//            let hexString = self
//            let key: [UInt8] = Array(keyClass.key.utf8) as [UInt8]
//
//            let aes = try! AES(key: key, blockMode: .ECB, padding: .pkcs7) //AES128 .ECB pkcs7
//            let decrypted = try aes.decrypt(Array(hex: hexString))
//
//            result = String(data: Data(decrypted), encoding: .utf8) ?? ""
//
//        } catch {
//            print(error)
//        }
//            return result
//        }

//        let data = self.data(using: .utf8)!
//        let encrypted = try! AES(key: key, iv: iv, blockMode: .ECB, padding: .pkcs7).encrypt([UInt8](data))
//        let encryptedData = Data(encrypted)
//        return encryptedData.base64EncodedString()
    
//    func aesDecrypt(_ key: String, iv: String) throws -> String {
//        let data = Data(base64Encoded: self)!
//        let decrypted = try! AES(key: key, iv: iv, blockMode: .ECB, padding: .pkcs7).decrypt([UInt8](data))
//        let decryptedData = Data(decrypted)
//        return String(bytes: decryptedData.bytes, encoding: .utf8) ?? "Could not decrypt"
//
//    }



    

