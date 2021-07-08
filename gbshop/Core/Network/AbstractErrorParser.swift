//
//  AbstractErrorParser.swift
//  gbshop
//
//  Created by Илья on 05.07.2021.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
