//
//  AuthPresenter.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

class AuthPresenter {

    private let interactor: AuthPresenterToInteractorProtocol
    private let router: AuthPresenterToRouterProtocol
    private weak var controller: AuthPresenterToViewProtocol?

    init(interactor: AuthPresenterToInteractorProtocol,
         router: AuthPresenterToRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func setController(controller: AuthPresenterToViewProtocol) {
        self.controller = controller
    }
}

extension AuthPresenter: AuthViewToPresenterProtocol {

    func startSendLoginRequest(login: String, password: String) {
        self.interactor.sendLoginRequest(login: login, password: password)
    }
}

extension AuthPresenter: AuthInteractorToPresenterProtocol {
    func startMoveToUserAccountView() {
        self.router.moveToUserAccountView()
    }

    func startShowMessage(text: String, messageType: MessageTypeEnum) {
        self.router.showMessage(text: text, messageType: messageType)
    }

}

