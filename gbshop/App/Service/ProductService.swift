//
//  ProductService.swift
//  gbshop
//
//  Created by Илья on 12.08.2021.
//

import Foundation
import FirebaseAnalytics

class ProductService {

    func logEventGetAllProduct(success: Bool, content: String?) {
        Analytics.logEvent(CustomAnalyticsEvent.getAllProduct.rawValue,
                           parameters:  [
                            AnalyticsParameterSuccess: success,
                            AnalyticsParameterContent: content ?? ""
                          ])
    }
}
