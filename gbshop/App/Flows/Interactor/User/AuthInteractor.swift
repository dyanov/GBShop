//
//  AuthInteractor.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Foundation
import FirebaseAnalytics

class AuthInteractor: AuthPresenterToInteractorProtocol {

    private let requestFactory = RequestFactory()
    private let serviceFactory = ServiceFactory()

    private weak var presenter: AuthInteractorToPresenterProtocol?

    func setPresenter(presenter: AuthInteractorToPresenterProtocol) {
        self.presenter = presenter
    }

    func sendLoginRequest(login: String, password: String) {

        let userFactory = serviceFactory.makeUserService()
        let authDataIsEmpty = userFactory.authDataIsEmpty(login: login, password: password)

        guard !authDataIsEmpty else {
            self.presenter?.startShowMessage(text: "login or password is empty", messageType: .error)
            userFactory.logEventLogin(success: false, content: "login or password is empty")
            return
        }

        let userRequestFactory = requestFactory.makeUserRequestFatory()

        userRequestFactory.login(userName: login, password: password) { [weak self] response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(_):
                    self?.presenter?.startMoveToUserAccountView()
                    userFactory.logEventLogin(success: true, content: nil)
                case .failure(let error):
                    self?.presenter?.startShowMessage(text: "\(error)", messageType: .error)
                    userFactory.logEventLogin(success: false, content: "Bad URL or server error")
                }
            }
        }

    }
}
