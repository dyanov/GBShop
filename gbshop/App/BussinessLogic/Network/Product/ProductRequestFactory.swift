//
//  ProductRequestFactory.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Alamofire

protocol ProductRequestFactory {
    
    func getAllProduct(pageNumber: Int,
                       idCategory: Int,
                       completionHandler: @escaping (AFDataResponse<GetAllProductResponse>) -> Void)
    
    func getProductById(idProduct: Int,
                        completionHandler: @escaping (AFDataResponse<GetProductByIdResponse>) -> Void)
    
}

