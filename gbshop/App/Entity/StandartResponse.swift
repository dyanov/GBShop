//
//  StandartResponse.swift
//  gbshop
//
//  Created by Илья on 05.07.2021.
//

import Foundation

struct StandartResponse: Codable {
    let result: Int
    var errorMessage: String?
}
