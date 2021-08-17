//
//  BaseButton.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class BaseButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.backgroundColor = .systemGray
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
