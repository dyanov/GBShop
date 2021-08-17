//
//  UserAccountRouter.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class UserAccountRouter: UserAccountPresenterToRouterProtocol {

    internal weak var controller: UIViewController?
    internal let flowFactory = FlowFactory()

    func setController(controller: UIViewController) {
        self.controller = controller
    }

    func moveToAllProductsView() {
        let allProductController = flowFactory.makeAllProductFlow()
        self.controller?.navigationController?.pushViewController(allProductController, animated: true)
    }

}

