//
//  PresenterToRouterProtocol.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

protocol PresenterToRouterProtocol {
    var controller: UIViewController? {get set}
    var flowFactory: FlowFactory { get }
    func showMessage(text: String, messageType: MessageTypeEnum)
}

extension PresenterToRouterProtocol {

    func showMessage(text: String, messageType: MessageTypeEnum) {
        let message: UIAlertController
        switch messageType {
        case .message:
            message = flowFactory.makeMessageFlow(text: text)
        case .error:
            message = flowFactory.makeErrorFlow(text: text)
        }

        self.controller?.present(message, animated: true, completion: nil)
    }

}
