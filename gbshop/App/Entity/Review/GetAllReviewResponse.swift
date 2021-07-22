//
//  GetAllReviewResponse.swift
//  gbshop
//
//  Created by Илья on 12.07.2021.
//

import Foundation

struct GetAllReviewResponse: Codable {

    let result: Int
    let pageNumber: Int
    var errorMessage: String?
    let reviews: [Review]

    enum CodingKeys: String, CodingKey {
        case result = "result"
        case pageNumber = "page_number"
        case reviews = "reviews"
        case errorMessage = "error_message"
    }
}
