//
//  RequestFactory.swift
//  gbshop
//
//  Created by Илья on 05.07.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeUserRequestFactory() -> UserRequestFactory {
        let errorParser = makeErrorParser()
        return UserRequestFactoryRealise(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductRequestFatory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return ProductRequestFactoryRealise(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}

