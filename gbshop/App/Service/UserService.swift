//
//  UserService.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import FirebaseAnalytics

class UserService {

    func authDataIsEmpty(login: String, password: String) -> Bool {
        if login.isEmpty ||
            password.isEmpty {
            return true
        } else {
            return false
        }
    }

    func userDataIsEmpty(user: User) -> Bool {
        if user.lastname.isEmpty ||
            user.login.isEmpty ||
            user.name.isEmpty {
            return true
        } else {
            return false
        }
    }

    func extraUserInfoDataIsEmpty(extraUserInfo: ExtraUserInfo) -> Bool {
        if extraUserInfo.bio.isEmpty ||
            extraUserInfo.creditCard.isEmpty ||
            extraUserInfo.email.isEmpty ||
            extraUserInfo.gender.isEmpty ||
            extraUserInfo.password.isEmpty {
            return true
        } else {
            return false
        }
    }

    func logEventLogin(success: Bool, content: String?) {
        Analytics.logEvent(AnalyticsEventLogin,
                           parameters:  [
                            AnalyticsParameterSuccess: success,
                            AnalyticsParameterContent: content ?? ""
                          ])
    }

    func logEventChangeData(success: Bool, content: String?) {
        Analytics.logEvent(CustomAnalyticsEvent.ghangeUserData.rawValue,
                           parameters:  [
                            AnalyticsParameterSuccess: success,
                            AnalyticsParameterContent: content ?? ""
                          ])
    }
}


