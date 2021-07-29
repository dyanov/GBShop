//
//  BaseTextField.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class BaseTextField: UITextField {

    init(placeholder: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .systemGray2
        self.borderStyle = .line
        self.placeholder = placeholder
        self.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
