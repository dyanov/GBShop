//
//  Review.swift
//  gbshop
//
//  Created by Илья on 12.07.2021.
//

import Foundation

struct Review: Codable {
    var id: Int
    var text: String
    var idUser: Int
    var idProduct: Int

    enum CodingKeys: String, CodingKey {
        case id = "id_review"
        case text = "text"
        case idUser = "id_user"
        case idProduct = "id_product"
    }
}
