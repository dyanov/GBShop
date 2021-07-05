//
//  ExtraUserInfo.swift
//  gbshop
//
//  Created by Илья on 05.07.2021.
//

import Foundation

struct ExtraUserInfo: Codable {
    let id: Int
    let password: String
    let email: String
    let gender: String
    let creditCard: String
    let bio: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case password = "password"
        case email = "email"
        case gender = "gender"
        case creditCard = "credit_card"
        case bio = "bio"
    }
}
