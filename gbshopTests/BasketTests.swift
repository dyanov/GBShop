//
//  BasketTests.swift
//  gbshopTests
//
//  Created by Илья on 21.07.2021.
//

import XCTest
@testable import gbshop

class BasketTests: XCTestCase {

    var requestFactory: RequestFactory!
    let expectation = XCTestExpectation(description: "for basket requests")

    override func setUpWithError() throws {
        self.requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        self.requestFactory = nil
    }

    func testPayBasket() throws {
        let basketRequestFactory = requestFactory.makeBasketRequestFatory()

        basketRequestFactory.payBasket(idUser: 1) { response in
            switch response.result {
            case .success(let body):
                debugPrint(body)
                self.expectation.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testAddToBasket() throws {
        let basketRequestFactory = requestFactory.makeBasketRequestFatory()

        basketRequestFactory.addToBasket(itemOfBasket: ItemOfBasket(idProduct: 1, idUser: 2, quantity: 1)) { response in
            switch response.result {
            case .success(let body):
                debugPrint(body)
                self.expectation.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testDeleteFromBasket() throws {
        let basketRequestFactory = requestFactory.makeBasketRequestFatory()

        basketRequestFactory.deleteFromBasket(idUser: 123, idProduct: 456) { response in
            switch response.result {
            case .success(let body):
                debugPrint(body)
                self.expectation.fulfill()
            case .failure(let error):
                XCTFail("\(error)")
            }
        }
        wait(for: [expectation], timeout: 10.0)
    }

}
