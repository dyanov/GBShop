//
//  ProductReqFactoryRealise.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Alamofire
import Firebase

class ProductReqFactoryRealise: AbstractRequestFactory {

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    var baseUrl: URL {
        guard let baseUrl = URL(string: ServerPath.herokuBaseUrl.rawValue) else {
            Crashlytics.crashlytics().log("bad URL")
            fatalError("bad URL")
        }
        return baseUrl
    }

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ProductReqFactoryRealise: ProductRequestFactory {
    func getAllProduct(pageNumber: Int, idCategory: Int,
                       completionHandler: @escaping (AFDataResponse<GetAllProductResponse>) -> Void) {
        let requestModel = GetAllProductRouter(baseUrl: baseUrl, pageNumber: pageNumber, idCategory: idCategory)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func getProductById(idProduct: Int,
                        completionHandler: @escaping (AFDataResponse<GetProductByIdResponse>) -> Void) {
        let requestModel = GetProductByIdRouter(baseUrl: baseUrl, idProduct: idProduct)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

}

extension ProductReqFactoryRealise {

    struct GetAllProductRouter: RequestRouter {

        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = ServerPath.getAllProduct.rawValue
        let pageNumber: Int
        let idCategory: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": idCategory
            ]
        }
    }

    struct GetProductByIdRouter: RequestRouter {

        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = ServerPath.getProductById.rawValue
        let idProduct: Int
        var parameters: Parameters? {
            return [
                "id_product": idProduct
            ]
        }
    }
}
