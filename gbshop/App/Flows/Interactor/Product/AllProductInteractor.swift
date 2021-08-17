//
//  AllProductInteractor.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Foundation

class AllProductInteractor: AllProductPresenterToInteractorProtocol {
    private let requestFactory = RequestFactory()
    private let serviceFactory = ServiceFactory()

    private weak var presenter: AllProductInteractorToPresenterProtocol?

    func setPresenter(presenter: AllProductInteractorToPresenterProtocol) {
        self.presenter = presenter
    }

    func getAllProduct() {
        let productRequestFactory = requestFactory.makeProductRequestFatory()
        productRequestFactory.getAllProduct(pageNumber: 0, idCategory: 0) { [weak self] (response) in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    self?.presenter?.getAllProductSuccess(products: result.products)

                case .failure(let error):

                    self?.presenter?.startShowMessage(text: "\(error)", messageType: .error)

                }
            }
        }
    }
}

