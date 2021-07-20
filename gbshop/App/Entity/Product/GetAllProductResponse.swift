//
//  GetAllProductResponse.swift
//  gbshop
//
//  Created by Илья on 12.07.2021.
//

import Foundation

struct GetAllProductResponse: Codable {
    
    let result: Int
    let pageNumber: Int
    var errorMessage: String?
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case result = "result"
        case pageNumber = "page_number"
        case products = "products"
        case errorMessage = "error_message"
    }
}
