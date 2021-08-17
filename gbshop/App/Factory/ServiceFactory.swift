//
//  ServiceFactory.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Foundation

class ServiceFactory {
    func makeUserService() -> UserService {
        return UserService()
    }
}
