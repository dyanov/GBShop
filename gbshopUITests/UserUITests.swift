//
//  UserUITests.swift
//  gbshopUITests
//
//  Created by Илья on 12.08.2021.
//

import XCTest

class UserUITests: XCTestCase {
    
    var app: XCUIApplication!
    var userServiceUITest: UserServiceUITest!
    let loginTextFieldId = "login"
    let passwordTextFieldId = "password"
    let loginButtonId = "loginButton"
    let errorMessage = "Error!"

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        userServiceUITest = UserServiceUITest()
    }

    override func tearDownWithError() throws {
        app = nil
        userServiceUITest = nil
    }
    
    func testAuthFail() throws {
        let elementsQuery = app.scrollViews.otherElements
        let passwordTextField = elementsQuery.textFields[self.passwordTextFieldId]
        let loginTextField = elementsQuery.textFields[self.loginTextFieldId]
        userServiceUITest.enterAuthData(loginField: loginTextField,
                      passwordField: passwordTextField,
                      loginData: "",
                      passwordData: "")
        let loginButton = elementsQuery.buttons[self.loginButtonId]
        if loginButton.waitForExistence(timeout: 12) {
            loginButton.tap()
        }
        XCTAssert(userServiceUITest.textFieldIsEmpty(textField: passwordTextField))
        XCTAssert(userServiceUITest.textFieldIsEmpty(textField: loginTextField))
        self.checkAlertMessage(message: "Empty Login/Password")
        
        
    }
    
    func checkAlertMessage(message: String) {
        let token = addUIInterruptionMonitor(withDescription: message, handler: { alert in
            let textAlert = alert.staticTexts[self.errorMessage]
            XCTAssertNotNil(textAlert)
            XCTAssertEqual(message, textAlert.title)
            alert.buttons["Ok"].tap()
            return true
            
        })
        // Диалоги находятся в другом потоке, поэтому дадим им некоторое время для синхронизации
        RunLoop.current.run(until: Date(timeInterval: 10, since: Date()))
        print(app.debugDescription)
        // Чтобы снова взаимодействовать с приложением
        app.tap()
        removeUIInterruptionMonitor(token)
    
    }

    

    
    func testAuthSuccess() {
        let elementsQuery = app.scrollViews.otherElements
        let passwordTextField = elementsQuery.textFields[self.passwordTextFieldId]
        let loginTextField = elementsQuery.textFields[self.loginTextFieldId]
        userServiceUITest.enterAuthData(loginField: loginTextField,
                      passwordField: passwordTextField,
                      loginData: "qwerty",
                      passwordData: "1234")
        elementsQuery.buttons[self.loginButtonId].tap()
        XCTAssert(!userServiceUITest.textFieldIsEmpty(textField: passwordTextField))
        XCTAssert(!userServiceUITest.textFieldIsEmpty(textField: loginTextField))
    }

}
