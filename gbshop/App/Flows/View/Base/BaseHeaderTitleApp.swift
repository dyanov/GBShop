//
//  BaseHeaderTitleApp.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class BaseHeaderTitleApp: UILabel {
    init() {
        super.init(frame: .zero)
        self.text = "GeekBrains Shop"
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
