//
//  UserRequestFactory.swift
//  gbshop
//
//  Created by Илья on 05.07.2021.
//

import Foundation
import Alamofire

protocol UserRequestFactory {
    
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResponse>) -> Void)
    
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
    
    func registration(user: User, extraUserInfo: ExtraUserInfo, completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
    
    func changeUserData(user: User, extraUserInfo: ExtraUserInfo, completionHandler: @escaping (AFDataResponse<StandartResponse>) -> Void)
    
}
