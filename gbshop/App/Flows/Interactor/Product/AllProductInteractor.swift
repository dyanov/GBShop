//
//  AllProductInteractor.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Foundation
import FirebaseAnalytics

class AllProductInteractor: AllProductPresenterToInteractorProtocol {
    private let requestFactory = RequestFactory()
    private let serviceFactory = ServiceFactory()

    private weak var presenter: AllProductInteractorToPresenterProtocol?

    func setPresenter(presenter: AllProductInteractorToPresenterProtocol) {
        self.presenter = presenter
    }

    func getAllProduct() {
        let productFactory = serviceFactory.makeProductService()
        let productRequestFactory = requestFactory.makeProductRequestFatory()
        productRequestFactory.getAllProduct(pageNumber: 0, idCategory: 0) { [weak self] (response) in
            DispatchQueue.main.async { [weak self] in
                switch response.result {
                case .success(let result):
                    self?.presenter?.getAllProductSuccess(products: result.products)
                    productFactory.logEventGetAllProduct(success: true, content: nil)

                case .failure(let error):
                    self?.presenter?.startShowMessage(text: "\(error)", messageType: .error)
                    productFactory.logEventGetAllProduct(success: false, content: "Server error")

                }
            }
        }
    }
}

