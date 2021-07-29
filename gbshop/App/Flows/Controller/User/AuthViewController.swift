//
//  AuthViewController.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class AuthViewController: UIViewController {

    private let viewFactory = CustomViewFactory()
    private var authView: BaseViewWithScroll<AuthView>?
    private let presenter: AuthViewToPresenterProtocol

    override func loadView() {
        super.loadView()
        authView = viewFactory.makeAuthView()
        self.view = authView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()

    }

    private func setupButton() {
        self.authView?.contentView
            .loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }

    @objc func loginButtonAction() {
        let loginText = self.authView?.contentView.loginTextField.text ?? ""
        let passwordText = self.authView?.contentView.passwordTextField.text ?? ""
        self.presenter.startSendLoginRequest(login: loginText, password: passwordText)
    }

    init(presenter: AuthViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AuthViewController: AuthPresenterToViewProtocol {

}
