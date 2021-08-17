//
//  gbshopUITests.swift
//  gbshopUITests
//
//  Created by Илья on 01.07.2021.
//

import XCTest

class gbshopUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        setupSnapshot(app)

        app.launch()
    }
    
    func testExample() {
        
        snapshot("LoginScreen")
        
        app.textFields["username"].tap()
        app.textFields["username"].typeText("test")
        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("test")
        app.buttons["Log In"].tap()
        
        app.staticTexts["Welcome!"].tap()
        app.staticTexts["John Doe"].tap()

        snapshot("WelcomeScreen")

        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Product"].tap()

        snapshot("ProductScreen")
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
