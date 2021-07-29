//
//  GenderPickerSetting.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Foundation

enum GenderPickerSetting: String {
    case man = "m"
    case woman = "w"

    func nameToString() -> String {
        return "\(self)"
    }
}
