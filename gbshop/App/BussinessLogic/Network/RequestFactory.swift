//
//  RequestFactory.swift
//  gbshop
//
//  Created by Илья on 05.07.2021.
//

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
    
    func makeUserRequestFatory() -> UserRequestFactory {
        let errorParser = makeErrorParser()
        return UserRequestFactoryRealise(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeProductRequestFatory() -> ProductRequestFactory {
        let errorParser = makeErrorParser()
        return ProductReqFactoryRealise(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeReviewRequestFatory() -> ReviewRequestFactory {
            let errorParser = makeErrorParser()
            return ReviewRequestFactoryRealise(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
        }
}

