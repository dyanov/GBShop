//
//  ProductRequestFactoryRealise.swift
//  gbshop
//
//  Created by Илья on 08.07.2021.
//

import Foundation
import Alamofire

class ProductRequestFactoryRealise: AbstractRequestFactory {
    
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}


extension ProductRequestFactoryRealise: ProductRequestFactory {
    func getAllProduct(completionHandler: @escaping (AFDataResponse<[Product]>) -> Void) {
        let requestModel = GetAllProductRouter(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    func getProductById(id: Int, completionHandler: @escaping (AFDataResponse<SingleProduct>) -> Void) {
        let requestModel = GetProductByIdRouter(baseUrl: baseUrl)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}

extension ProductRequestFactoryRealise {
    
    struct GetAllProductRouter: RequestRouter {
        
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        var parameters: Parameters?
    }
    
    struct GetProductByIdRouter: RequestRouter {
        
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"
        var parameters: Parameters?
    }
}
