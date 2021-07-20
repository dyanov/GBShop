//
//  LoginResponse.swift
//  gbshop
//
//  Created by Илья on 05.07.2021.
//

import Foundation

struct LoginResponse: Codable {
    let result: Int
    let user: User
    let errorMessage: String?
}
