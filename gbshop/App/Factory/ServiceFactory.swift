//
//  ServiceFactory.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

class ServiceFactory {
    func makeUserService() -> UserService {
        return UserService()
    }

    func makeProductService() -> ProductService {
        return ProductService()
    }
}

