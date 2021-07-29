//
//  ProductCell.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class ProductCell: UITableViewCell {

    let stackNamePrice: BaseHorizontalStackView = {
        let stackNamePrice = BaseHorizontalStackView()
        return stackNamePrice
    }()

    let nameLabel: BaseLabel = {
        let nameLabel = BaseLabel()
        return nameLabel
    }()

    let priceLabel: BaseLabel = {
        let priceLabel = BaseLabel()
        return priceLabel
    }()

    let descriptionLabelArea: BaseLabelArea = {
        let descriptionLabelArea = BaseLabelArea()
        return descriptionLabelArea
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuration()
    }

    private func configuration() {
        self.setupStackNameAndPrice()
        self.setupDescription()
        self.backgroundColor = .white
    }

    private func setupDescription() {
        self.addSubview(self.descriptionLabelArea)
        NSLayoutConstraint.activate([
            descriptionLabelArea.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionLabelArea.topAnchor.constraint(equalTo: self.stackNamePrice.bottomAnchor,
                                                constant:MarginSettingsEnum.betweenTextField.rawValue),
            descriptionLabelArea.widthAnchor.constraint(equalTo: self.stackNamePrice.widthAnchor)
        ])
    }

    private func setupStackNameAndPrice() {
        self.addSubview(self.stackNamePrice)
        stackNamePrice.addArrangedSubview(self.nameLabel)
        stackNamePrice.addArrangedSubview(self.priceLabel)
        NSLayoutConstraint.activate([
            stackNamePrice.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackNamePrice.topAnchor.constraint(equalTo: self.topAnchor,
                                         constant:MarginSettingsEnum.baseTopAnchor.rawValue),
            stackNamePrice.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
