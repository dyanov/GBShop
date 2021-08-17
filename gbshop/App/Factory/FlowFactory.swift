//
//  FlowFactory.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class FlowFactory {
    func makeAuthFlow() -> AuthViewController {
        let router = AuthRouter()
        let interactor = AuthInteractor()
        let presenter = AuthPresenter(interactor: interactor, router: router)
        let authViewController = AuthViewController(presenter: presenter)
        router.setController(controller: authViewController)
        interactor.setPresenter(presenter: presenter)
        presenter.setController(controller: authViewController)

        return authViewController
    }

    func makeErrorFlow(text: String) -> UIAlertController {
        let alert = UIAlertController(title: "🤬 Error", message: text, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        return alert
    }

    func makeMessageFlow(text: String) -> UIAlertController {
        let alert = UIAlertController(title: "💕 Message", message: text, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        return alert
    }

    func makeUserAccountFlow() -> UserAccountViewController {
        let router = UserAccountRouter()
        let interactor = UserAccountInteractor()
        let presenter = UserAccountPresenter(interactor: interactor, router: router)
        let userAccountViewController = UserAccountViewController(presenter: presenter)
        router.setController(controller: userAccountViewController)
        interactor.setPresenter(presenter: presenter)
        presenter.setController(controller: userAccountViewController)

        return userAccountViewController
    }

    func makeAllProductFlow() -> AllProductTableController {
        let router = AllProductRouter()
        let interactor = AllProductInteractor()
        let presenter = AllProductPresenter(interactor: interactor, router: router)
        let allProductTableController = AllProductTableController(presenter: presenter)
        router.setController(controller: allProductTableController)
        interactor.setPresenter(presenter: presenter)
        presenter.setController(controller: allProductTableController)

        return allProductTableController
    }
}

