//
//  UserService.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

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
}

