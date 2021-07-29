//
//  BaseLabelArea.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class BaseLabelArea: UILabel {

    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configuration()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }

    private func configuration() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
