//
//  MD5Digester.swift
//  OtoscopeSimulator
//
//  Created by John Holcroft on 15/09/2016.
//  Copyright © 2016 John Holcroft. All rights reserved.
//

import Foundation

struct MD5Digester {
    // return MD5 digest of string provided
    static func digest(string: String) -> String? {
        
        guard let data = string.data(using: String.Encoding.utf8) else { return nil }
        
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = data.withUnsafeBytes { bytes in
            CC_MD5(bytes, CC_LONG(data.count), &digest)
        }
        
        return (0..<Int(CC_MD5_DIGEST_LENGTH)).reduce("") { $0 + String(format: "%02x", digest[$1]) }
    }
}
