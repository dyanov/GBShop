//
//  AddReviewRequest.swift
//  gbshop
//
//  Created by Илья on 12.07.2021.
//

import Foundation

struct AddReviewRequest: Codable {

    let idUser: Int
    let idProduct: Int
    let text: String

    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case idProduct = "id_product"
        case text = "text"
    }
}
