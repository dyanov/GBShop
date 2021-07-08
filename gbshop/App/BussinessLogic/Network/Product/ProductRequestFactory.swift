//
//  ProductRequestFactory.swift
//  gbshop
//
//  Created by Илья on 08.07.2021.
//

import Foundation
import Alamofire

protocol ProductRequestFactory {
    func getAllProduct(completionHandler: @escaping (AFDataResponse<[Product]>) -> Void)
    func getProductById(id: Int, completionHandler: @escaping (AFDataResponse<SingleProduct>) -> Void)
}
