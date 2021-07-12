//
//  UserTests.swift
//  gbshopTests
//
//  Created by Илья on 08.07.2021.
//

import XCTest
@testable import gbshop

class UserTests: XCTestCase {
    
    var requestFactory: RequestFactory!
    let expectation = XCTestExpectation(description: "for user requests")

    override func setUpWithError() throws {
        self.requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        self.requestFactory = nil
    }

    func testLogin() throws {
        let userRequestFactory = requestFactory.makeUserRequestFatory()
        
        userRequestFactory.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                debugPrint(login)
                self.expectation.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLogout() throws {
        let userRequestFactory = requestFactory.makeUserRequestFatory()
        userRequestFactory.logout(idUser: 123) { response in
            switch response.result {
            case .success(let login):
                debugPrint(login)
                self.expectation.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testRegistration() throws {
        let userRequestFactory = requestFactory.makeUserRequestFatory()
        let user = User(id: 0, login: "", name: "Somebody", lastname: "lastname")
        let extraUserInfo = ExtraUserInfo(id: 0, password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language")
        
        userRequestFactory.registration(user: user, extraUserInfo: extraUserInfo) { response in
            switch response.result {
            case .success(let result):
                debugPrint(result.result)
                self.expectation.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testChangeUserData() throws {
        let userRequestFactory = requestFactory.makeUserRequestFatory()
        let user = User(id: 123, login: "", name: "Somebody", lastname: "lastname")
        let extraUserInfo = ExtraUserInfo(id: user.id, password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "5536-7777-8888-9999", bio: "This is good! I think I will switch to another language")
        
        userRequestFactory.changeUserData(user: user, extraUserInfo: extraUserInfo) { response in
            switch response.result {
            case .success(let result):
                debugPrint(result.result)
                self.expectation.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
}
