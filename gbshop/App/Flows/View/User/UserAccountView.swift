//
//  UserAccountView.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class UserAccountView: UIView {

    var loginTextField: BaseTextField = {
        let loginTextField = BaseTextField(placeholder: "Login")
        loginTextField.isEnabled = false
        loginTextField.text = loginTextField.placeholder
        return loginTextField
    }()

    var passwordTextField: BaseTextField = {
        let passwordTextField = BaseTextField(placeholder: "Password")
        passwordTextField.text = passwordTextField.placeholder
        passwordTextField.isSecureTextEntry = true
        passwordTextField.isEnabled = false
        return passwordTextField
    }()

    var emailTextField: BaseTextField = {
        let emailTextField = BaseTextField(placeholder: "Email")
        emailTextField.text = emailTextField.placeholder
        emailTextField.isEnabled = false
        return emailTextField
    }()

    var genderPickerView: UIPickerView = {
        let genderPickerView = UIPickerView()
        genderPickerView.translatesAutoresizingMaskIntoConstraints = false
        genderPickerView.isUserInteractionEnabled = false
        return genderPickerView
    }()

    var creditCardTextField: BaseTextField = {
        let creditCardTextField = BaseTextField(placeholder: "Credit card")
        creditCardTextField.text = creditCardTextField.placeholder
        creditCardTextField.isEnabled = false
        return creditCardTextField
    }()

    var bioTextField: BaseTextField = {
        let bioTextField = BaseTextField(placeholder: "BIO")
        bioTextField.text = bioTextField.placeholder
        bioTextField.isEnabled = false
        return bioTextField
    }()

    var saveUserDataButton: BaseButton = {
        let saveUserDataButton = BaseButton(title: "Save user data")
        saveUserDataButton.isHidden = true
        return saveUserDataButton
    }()

    var toProductsViewButton: BaseButton = {
        let toProductsViewButton = BaseButton(title: "To Products")
        return toProductsViewButton
    }()

    var editDataBarButton: UIBarButtonItem = {
        let editDataBarButton = UIBarButtonItem()
        editDataBarButton.image = UIImage(systemName: "pencil")
        return editDataBarButton
    }()

    init() {
        super.init(frame: .zero)
        self.setupContentView()
    }

    private func setupLoginTextField() {
        self.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3/4)])
    }

    private func setupPasswordTextField() {
        self.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor,
                                                   constant:MarginSettingsEnum.betweenTextField.rawValue),
            passwordTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor)
        ])
    }

    private func setupEmaiTextField() {
        self.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor,
                                                constant:MarginSettingsEnum.betweenTextField.rawValue),
            emailTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor)
        ])
    }

    private func setupGenderPickerView() {
        self.addSubview(genderPickerView)
        NSLayoutConstraint.activate([
            genderPickerView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            genderPickerView.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor,
                                                  constant:MarginSettingsEnum.betweenTextField.rawValue),
            genderPickerView.widthAnchor.constraint(equalTo: loginTextField.widthAnchor),
            genderPickerView.heightAnchor.constraint(equalTo: genderPickerView.widthAnchor, multiplier: 1/4)
        ])
    }

    private func setupCreditCardTextField() {
        self.addSubview(creditCardTextField)
        NSLayoutConstraint.activate([
            creditCardTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            creditCardTextField.topAnchor.constraint(equalTo:self.genderPickerView.bottomAnchor,
                                                     constant:MarginSettingsEnum.betweenTextField.rawValue),
            creditCardTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor)
        ])
    }

    private func setupBioTextField() {
        self.addSubview(bioTextField)
        NSLayoutConstraint.activate([
            bioTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            bioTextField.topAnchor.constraint(equalTo: self.creditCardTextField.bottomAnchor,
                                              constant:MarginSettingsEnum.betweenTextField.rawValue),
            bioTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor)
        ])
    }

    private func setupSaveUserDataButton() {
        self.addSubview(saveUserDataButton)
        NSLayoutConstraint.activate([
            saveUserDataButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            saveUserDataButton.topAnchor.constraint(equalTo: self.bioTextField.bottomAnchor,
                                                    constant:MarginSettingsEnum.betweenButton.rawValue),
            saveUserDataButton.widthAnchor.constraint(equalTo: loginTextField.widthAnchor)
        ])
    }

    private func setupToProductsViewButton() {
        self.addSubview(toProductsViewButton)
        NSLayoutConstraint.activate([
            toProductsViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            toProductsViewButton.topAnchor.constraint(equalTo: self.saveUserDataButton.bottomAnchor,
                                                      constant: MarginSettingsEnum.betweenButton.rawValue),
            toProductsViewButton.widthAnchor.constraint(equalTo: loginTextField.widthAnchor),
            toProductsViewButton.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func setupContentView() {
        setupLoginTextField()
        setupPasswordTextField()
        setupEmaiTextField()
        setupGenderPickerView()
        setupCreditCardTextField()
        setupBioTextField()
        setupSaveUserDataButton()
        setupToProductsViewButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

