//
//  FirstViewController.swift
//  gbshop
//
//  Created by Илья on 21.07.2021.
//

import UIKit

class FirstViewController: UIViewController {

    let requestFactory: RequestFactory

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan

    }

    init(requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
