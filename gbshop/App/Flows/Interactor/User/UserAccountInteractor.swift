//
//  UserAccountInteractor.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Foundation

class UserAccountInteractor: UserAccountPresenterToInteractorProtocol {

    private let requestFactory = RequestFactory()
    private let serviceFactory = ServiceFactory()
    private weak var presenter: UserAccountInteractorToPresenterProtocol?

    func setPresenter(presenter: UserAccountInteractorToPresenterProtocol) {
        self.presenter = presenter
    }

    func getDataForGenderPicker() {
        let dataForGenderPicker = [GenderPickerSetting.man, GenderPickerSetting.woman]
        presenter?.getBackDataForGenderPicker(dataForGenderPicker: dataForGenderPicker)
    }

    func saveUserData(user: User, extraUserInfo: ExtraUserInfo) {

        let userDataIsEmpty = serviceFactory.makeUserService().userDataIsEmpty(user: user)
        let extraUserInfoDataIsEmpty = serviceFactory
            .makeUserService()
            .extraUserInfoDataIsEmpty(extraUserInfo: extraUserInfo)

        guard !userDataIsEmpty && !extraUserInfoDataIsEmpty else {
            self.presenter?.startShowMessage(text: "There is empty field(s)", messageType: .error)
            return
        }

        let userRequestFactory = requestFactory.makeUserRequestFatory()
        userRequestFactory.changeUserData(user: user, extraUserInfo: extraUserInfo) { [weak self] response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(_):
                    self?.presenter?.startShowMessage(text: "User data was saved", messageType: .message)
                case .failure(let error):
                    self?.presenter?.startShowMessage(text: "\(error)", messageType: .error)
                }
            }
        }
    }

}
