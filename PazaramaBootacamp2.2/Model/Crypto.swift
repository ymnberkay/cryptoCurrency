//
//  Crypto.swift
//  PazaramaBootacamp2.2
//
//  Created by Berkay Yaman on 21.10.2023.
//

import Foundation

struct Crypto: Codable {
    let currency: String
    let price: String
    
    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case price = "price"
    }
    
}
