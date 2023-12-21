//
//  APIEndpoint.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import Foundation
import CommonCrypto
import CryptoKit

struct APIEndpoint {
    static let peopleListEndPoint: String = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/people"
}

func saveDataUsingCryptoKit() -> Any? {
    let dataToEncrypt = "Test Data".data(using: .utf8)
    if let data = dataToEncrypt {
        let data256 = SHA256.hash(data: data)
        let data284 = SHA384.hash(data: data)
        let data512 = SHA512.hash(data: data)
        
        return data256
    } else {
        return nil
    }
}
