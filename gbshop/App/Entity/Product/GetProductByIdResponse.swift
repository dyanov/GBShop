//
//  GetProductByIdResponse.swift
//  gbshop
//
//  Created by Илья on 12.07.2021.
//

import Foundation

struct GetProductByIdResponse: Codable {
    
    let result: Int
    var errorMessage: String?
    let product: Product
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case product = "product"
        case errorMessage = "error_message"
    }
}
