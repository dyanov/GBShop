//
//  UserAccountViewController.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class UserAccountViewController: UIViewController {

    private let viewFactory = CustomViewFactory()
    private var userAccountView: BaseViewWithScroll<UserAccountView>?
    private let presenter: UserAccountViewToPresenterProtocol

    private var genderPickerDataArray = [GenderPickerSetting]()

    override func loadView() {
        super.loadView()
        userAccountView = viewFactory.makeUserAccountView()
        self.view = userAccountView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User account"
        setupPicker()
        setupButtons()

    }

    private func setupPicker() {
        self.userAccountView?.contentView.genderPickerView.delegate = self
        self.userAccountView?.contentView.genderPickerView.dataSource = self
        self.presenter.startGetDataForGenderPicker()
    }

    private func setupButtons() {
        self.userAccountView?.contentView.editDataBarButton.target = self
        self.userAccountView?.contentView.editDataBarButton.action = #selector(editDataBarButtonAction)
        self.navigationItem.rightBarButtonItem = self.userAccountView?.contentView.editDataBarButton
        self.userAccountView?.contentView
            .saveUserDataButton
            .addTarget(self,action: #selector(saveUserDataButtonAction),for: .touchUpInside)

        self.userAccountView?.contentView
            .toProductsViewButton
            .addTarget(self, action: #selector(toProductsViewButtonAction), for: .touchUpInside)
    }

    @objc func  toProductsViewButtonAction() {
        self.presenter.startMoveToAllProductsView()
    }

    @objc func saveUserDataButtonAction() {
        let user = User(id: 0,
                        login: self.userAccountView?.contentView.loginTextField.text ?? "",
                        name: "name",
                        lastname: "last name")
        let genderIndex = self.userAccountView?.contentView.genderPickerView.selectedRow(inComponent: 0) ?? 0
        let gender =  self.genderPickerDataArray[genderIndex].rawValue
        let extraUserInfo = ExtraUserInfo(id: 0,
                                          password: self.userAccountView?.contentView.passwordTextField.text ?? "",
                                          email: self.userAccountView?.contentView.emailTextField.text ?? "",
                                          gender: gender,
                                          creditCard: self.userAccountView?.contentView.creditCardTextField.text ?? "",
                                          bio: self.userAccountView?.contentView.bioTextField.text ?? "")
        self.presenter.startSaveUserData(user: user, extraUserInfo: extraUserInfo)
    }

    @objc func editDataBarButtonAction() {
        self.userAccountView?.contentView.bioTextField.isEnabled = true
        self.userAccountView?.contentView.creditCardTextField.isEnabled = true
        self.userAccountView?.contentView.emailTextField.isEnabled = true
        self.userAccountView?.contentView.genderPickerView.isUserInteractionEnabled = true
        self.userAccountView?.contentView.loginTextField.isEnabled = true
        self.userAccountView?.contentView.passwordTextField.isEnabled = true
        self.userAccountView?.contentView.saveUserDataButton.isHidden = false
    }

    init(presenter: UserAccountViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension UserAccountViewController: UserAccountPresenterToViewProtocol {
    func getBackDataForGenderPicker(dataForGenderPicker: [GenderPickerSetting]) {
        self.genderPickerDataArray = dataForGenderPicker
        self.userAccountView?.contentView.genderPickerView.reloadAllComponents()
    }
}

extension UserAccountViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        self.genderPickerDataArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = self.genderPickerDataArray[row].nameToString()
       return row
    }
}
