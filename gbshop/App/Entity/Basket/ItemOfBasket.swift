//
//  ItemOfBasket.swift
//  gbshop
//
//  Created by Илья on 21.07.2021.
//

import Foundation

struct ItemOfBasket: Codable {

    let idProduct: Int
    let idUser: Int
    let quantity: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case idUser = "id_user"
        case quantity = "quantity"
    }
}
