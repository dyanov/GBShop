//
//  BaseViewWithScroll.swift
//  gbshop
//
//  Created by Илья on 29.07.2021.
//

import UIKit

class BaseViewWithScroll<ContentType: UIView>: UIView {

    let contentView: ContentType

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    init(contentView: ContentType) {
        self.contentView = contentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.backgroundColor = .systemGray4
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        setupKeyBoard()
    }

    @objc func keyboardWillShow(notification: Notification) {
        guard let kbSize = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
     }

     @objc func keyboardWillHide(notification: Notification) {
        self.scrollView.contentInset = .zero
     }

    private func setupKeyBoard() {
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.scrollView.addGestureRecognizer(hideKeyboardGesture)
    }

    @objc func hideKeyboard() {
        self.scrollView.endEditing(true)
    }

}
