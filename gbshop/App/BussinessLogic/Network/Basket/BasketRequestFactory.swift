//
//  BasketRequestFactory.swift
//  gbshop
//
//  Created by Илья on 21.07.2021.
//

import Foundation
import Alamofire

protocol BasketRequestFactory {
    
    func addToBasket(itemOfBasket: ItemOfBasket,
                     completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
    
    func deleteFromBasket(idUser: Int,
                          idProduct: Int,
                          completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
    
    func payBasket(idUser: Int,
                   completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
}
