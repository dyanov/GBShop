//
//  UserRequestFactoryRealise.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import Alamofire

class UserRequestFactoryRealise: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: ServerPath.herokuBaseUrl.rawValue)!

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension UserRequestFactoryRealise: UserRequestFactory {
    func changeUserData(user: User, extraUserInfo: ExtraUserInfo,
                        completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void) {
        let requestModel = ChangeUserDataRequestRouter(baseUrl: baseUrl, user: user,
                                                       extraUserInfo: extraUserInfo)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func registration(user: User, extraUserInfo: ExtraUserInfo,
                      completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void) {
        let requestModel = RegisterRequestRouter(baseUrl: baseUrl, user: user, extraUserInfo: extraUserInfo)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void) {
        let requestModel = LogoutRequestRouter(baseUrl: baseUrl, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func login(userName: String, password: String,
               completionHandler: @escaping (AFDataResponse<LoginResponse>) -> Void) {
        let requestModel = LoginRequestRouter(baseUrl: baseUrl, login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension UserRequestFactoryRealise {

    struct LoginRequestRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = ServerPath.loginPath.rawValue

        let login: String
        let password: String
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }

    struct LogoutRequestRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = ServerPath.logoutPath.rawValue
        let idUser: Int
        var parameters: Parameters? {
            return [
                "id_user": idUser
            ]
        }
    }

    struct RegisterRequestRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = ServerPath.registerPath.rawValue
        let user: User
        let extraUserInfo: ExtraUserInfo
        var parameters: Parameters? {
            return [
                "username": user.name,
                "password": extraUserInfo.password,
                "email": extraUserInfo.email,
                "gender": extraUserInfo.gender,
                "credit_card": extraUserInfo.creditCard,
                "bio": extraUserInfo.bio
            ]
        }
    }

    struct ChangeUserDataRequestRouter: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .put
        let path: String = ServerPath.changeUserData.rawValue
        let user: User
        let extraUserInfo: ExtraUserInfo
        var parameters: Parameters? {
            return [
                "username": user.name,
                "password": extraUserInfo.password,
                "email": extraUserInfo.email,
                "gender": extraUserInfo.gender,
                "credit_card": extraUserInfo.creditCard,
                "bio": extraUserInfo.bio,
                "id_user": user.id
            ]
        }
    }

}
