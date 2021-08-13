//
//  AllProductTableController.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class AllProductTableController: UIViewController {

    private let reuseIdentifier = "AllProductCell"

    private let presenter: AllProductViewToPresenterProtocol
    private let tableView = UITableView()
    private var allProducts = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.startGetAllProduct()

    }

    override func loadView() {
        super.loadView()
        self.view = self.tableView
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ProductCell.self, forCellReuseIdentifier: reuseIdentifier)
        self.view.backgroundColor = .systemGray4
        self.title = "All products"
    }

    init(presenter: AllProductViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AllProductTableController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.allProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductCell = tableView
            .dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
            as? ProductCell ?? ProductCell(style: .default, reuseIdentifier: reuseIdentifier)
        let currentProduct = self.allProducts[indexPath.row]
        cell.nameLabel.text = currentProduct.name
        cell.priceLabel.text = String(currentProduct.price)
        cell.descriptionLabelArea.text = currentProduct.description
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MarginSettingsEnum.heightCell.rawValue
    }

}

extension AllProductTableController: AllProductPresenterToViewProtocol {
    func getAllProduct(products: [Product]) {
        self.allProducts = products
        self.tableView.reloadData()
    }

}
