//
//  GetBasketResponse.swift
//  gbshop
//
//  Created by Илья on 21.07.2021.
//

import Foundation

struct GetBasketResponse: Codable {

    let result: Int
    let amount: Int
    var errorMessage: String?
    let contents: [Product]

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case amount = "amount"
        case contents = "contents"
        case errorMessage = "error_message"
    }
}
