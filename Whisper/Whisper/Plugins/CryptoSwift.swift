//
//  CryptpSwift.swift
//  Whisper
//
//  Created by Oliver Pople on 11/12/2017.
//  Copyright © 2017 Lucy Borthwick. All rights reserved.
//

import Foundation
import CryptoSwift

class CryptoSwift {

    func encrypt(text: String) -> String? {
        if let aes = try? AES(key: "passwordpassword", iv: "drowssapdrowssap"),
            let encrypted = try? aes.encrypt(Array(text.utf8)) {
            return encrypted.toHexString()
        }
        return nil
    }

    func decrypt(hexString: String) -> String? {
        if let aes = try? AES(key: "passwordpassword", iv: "drowssapdrowssap"),
            let decrypted = try? aes.decrypt(Array<UInt8>(hex: hexString)) {
            return String(data: Data(bytes: decrypted), encoding: .utf8)
        }
        return nil
    }

}
