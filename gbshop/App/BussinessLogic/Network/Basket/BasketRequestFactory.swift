//
//  BasketRequestFactory.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

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
