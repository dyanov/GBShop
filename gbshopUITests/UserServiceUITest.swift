//
//  UserServiceUITest.swift
//  gbshopUITests
//
//  Created by Илья on 12.08.2021.
//

import XCTest

class UserServiceUITest {
    func textFieldIsEmpty(textField: XCUIElement) -> Bool {
        if let textFieldText = textField.value as? String,
           textFieldText.isEmpty ||
           textFieldText == textField.placeholderValue {
            return true
        } else {
            return false
        }
    }
    
    func enterAuthData(loginField: XCUIElement, passwordField: XCUIElement, loginData: String, passwordData: String) {
        passwordField.tap()
        passwordField.typeText(passwordData)
        loginField.tap()
        loginField.typeText(loginData)
        
    }
}
