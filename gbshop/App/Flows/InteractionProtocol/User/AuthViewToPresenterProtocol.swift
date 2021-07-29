//
//  AuthViewToPresenterProtocol.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

protocol AuthViewToPresenterProtocol: AnyObject {
    func startSendLoginRequest(login: String, password: String)

}

protocol AuthPresenterToViewProtocol: AnyObject {

}

protocol AuthPresenterToRouterProtocol: PresenterToRouterProtocol, AnyObject {
    func moveToUserAccountView()
}

protocol AuthPresenterToInteractorProtocol: AnyObject {
    func sendLoginRequest(login: String, password: String)
}

protocol AuthInteractorToPresenterProtocol: AnyObject {
    func startMoveToUserAccountView()
    func startShowMessage(text: String, messageType: MessageTypeEnum)
}
