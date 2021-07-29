//
//  CustomViewFactory.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class CustomViewFactory {

    func makeAuthView() -> BaseViewWithScroll<AuthView> {
        return BaseViewWithScroll<AuthView>(contentView: AuthView())
    }

    func makeUserAccountView() -> BaseViewWithScroll<UserAccountView> {
        return BaseViewWithScroll<UserAccountView>(contentView: UserAccountView())
    }

}
