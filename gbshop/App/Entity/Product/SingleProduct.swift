//
//  ConcreteProduct.swift
//  gbshop
//
//  Created by Илья on 08.07.2021.
//

import Foundation

struct SingleProduct: Codable {
    
    let result: Int
      let name: String
      let price: Float
      
      enum CodingKeys: String, CodingKey {
          case result = "result"
          case name = "product_name"
          case price = "product_price"
      }
}
