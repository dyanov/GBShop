//
//  AuthInteractor.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Foundation

class AuthInteractor: AuthPresenterToInteractorProtocol {

    private let requestFactory = RequestFactory()
    private let serviceFactory = ServiceFactory()

    private weak var presenter: AuthInteractorToPresenterProtocol?

    func setPresenter(presenter: AuthInteractorToPresenterProtocol) {
        self.presenter = presenter
    }

    func sendLoginRequest(login: String, password: String) {

        let authDataIsEmpty = serviceFactory.makeUserService().authDataIsEmpty(login: login, password: password)

        guard !authDataIsEmpty else {
            self.presenter?.startShowMessage(text: "Enter username and password", messageType: .error)
            return
        }

        let userRequestFactory = requestFactory.makeUserRequestFatory()

        userRequestFactory.login(userName: login, password: password) { [weak self] response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(_):
                    self?.presenter?.startMoveToUserAccountView()
                case .failure(let error):

                    self?.presenter?.startShowMessage(text: "\(error)", messageType: .error)

                }
            }
        }

    }
}

