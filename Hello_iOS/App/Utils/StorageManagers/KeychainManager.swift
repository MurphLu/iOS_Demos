//
//  KeyChainManager.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/12.
//

import Foundation

class KeychainManager {
    static let shared = KeychainManager()
    
    private static let userService = "com.helloios.id"

    func keyChainQuaryDic(key: String) -> [CFString: Any] {
        return [
            // 存储类型
            kSecClass: kSecClassGenericPassword,
            // 服务
            kSecAttrService: KeychainManager.userService,
            // 账号
            kSecAttrAccount: key,
            // 访问权限
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock
        ]
    }
    
    func saveString(_ data: String, forKey key: String) -> Bool {
        var keyChainQuaryDic = self.keyChainQuaryDic(key: key)
        keyChainQuaryDic[kSecValueData] = data.data(using: String.Encoding.utf8, allowLossyConversion: false)! as NSData
        SecItemDelete(keyChainQuaryDic as CFDictionary)
        let saveState = SecItemAdd(keyChainQuaryDic as CFDictionary, nil)
        if saveState == noErr {
            return true
        }
        return false
    }
    
    func loadString(forKey key: String) -> String? {
        var keyChainQuaryDic = self.keyChainQuaryDic(key: key)
        keyChainQuaryDic[kSecReturnData] = kCFBooleanTrue
        keyChainQuaryDic[kSecMatchLimit] = kSecMatchLimitOne
        var dataTypeRef: AnyObject?
        
        let status: OSStatus = SecItemCopyMatching(keyChainQuaryDic as CFDictionary, &dataTypeRef)
        
        var value: String?
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? NSData {
                value = String(data: retrievedData as Data, encoding: String.Encoding.utf8)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        return value
    }
}
