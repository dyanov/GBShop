//
//  AuthRouter.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class AuthRouter: AuthPresenterToRouterProtocol {

    internal weak var controller: UIViewController?
    internal let flowFactory = FlowFactory()

    func setController(controller: UIViewController) {
        self.controller = controller
    }

    func moveToUserAccountView() {
        let userAccountViewController = flowFactory.makeUserAccountFlow()
        let navigateController = UINavigationController(rootViewController: userAccountViewController)
        navigateController.modalPresentationStyle = .fullScreen
        self.controller?.present(navigateController, animated: true)
    }

}
