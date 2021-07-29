//
//  AllProductViewToPresenterProtocol.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

protocol AllProductViewToPresenterProtocol: AnyObject {
    func startGetAllProduct()

}

protocol AllProductPresenterToViewProtocol: AnyObject {
    func getAllProduct(products: [Product])
}

protocol AllProductPresenterToRouterProtocol: PresenterToRouterProtocol, AnyObject {
}

protocol AllProductPresenterToInteractorProtocol: AnyObject {
    func getAllProduct()
}

protocol AllProductInteractorToPresenterProtocol: AnyObject {
    func getAllProductSuccess(products: [Product])
    func startShowMessage(text: String, messageType: MessageTypeEnum)
}
