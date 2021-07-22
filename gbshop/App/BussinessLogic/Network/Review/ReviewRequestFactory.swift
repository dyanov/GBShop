//
//  ReviewRequestFactory.swift
//  gbshop
//
//  Created by Илья on 12.07.2021.
//

import Foundation
import Alamofire

protocol ReviewRequestFactory {
    
    func getAllReview(completionHandler: @escaping (AFDataResponse<GetAllReviewResponse>) -> Void)
    
    func addReview(idUser: Int,
                   idProduct: Int,
                   text: String,
                   completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
    
    func deleteReview(idReview: Int,
                      completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
    
}
