//
//  UserAccountPresenter.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

class UserAccountPresenter {

    private let interactor: UserAccountPresenterToInteractorProtocol
    private let router: UserAccountPresenterToRouterProtocol
    private weak var controller: UserAccountPresenterToViewProtocol?

    init(interactor: UserAccountPresenterToInteractorProtocol,
         router: UserAccountPresenterToRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func setController(controller: UserAccountPresenterToViewProtocol) {
        self.controller = controller
    }
}

extension UserAccountPresenter: UserAccountViewToPresenterProtocol {
    func startGetDataForGenderPicker() {
        self.interactor.getDataForGenderPicker()
    }

    func startSaveUserData(user: User, extraUserInfo: ExtraUserInfo) {
        self.interactor.saveUserData(user: user, extraUserInfo: extraUserInfo)
    }

}

extension UserAccountPresenter: UserAccountInteractorToPresenterProtocol {

    func getBackDataForGenderPicker(dataForGenderPicker: [GenderPickerSetting]) {
        self.controller?.getBackDataForGenderPicker(dataForGenderPicker: dataForGenderPicker)
    }

    func startShowMessage(text: String, messageType: MessageTypeEnum) {
        self.router.showMessage(text: text, messageType: messageType)
    }

}
