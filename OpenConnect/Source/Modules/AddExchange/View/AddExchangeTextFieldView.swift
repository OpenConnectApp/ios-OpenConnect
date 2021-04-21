//
//  AddExchangeTextFieldView.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

class AddExchangeTextFieldView: UIView {

    private var textfield: UITextField = {
        let tf = UITextField()
        tf.placeholder = ""
        tf.font = UIFont.sectionTitle
        tf.textColor = .white
        return tf
    }()

    private var actionBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()

    private var divider: UIView = .view(background: UIColor.warmBlue.withAlphaComponent(0.1))

    var textValue: String {
        set {
            textfield.text = newValue
        }
        get {
            return textfield.text ?? ""
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupViews()
        themeViews()
        setupConstraints()
    }

    private func setupViews() {
        self.addAutoSubviews([textfield, actionBtn, divider])

        textfield.delegate = self
    }

    private func themeViews() {
    }

    private func setupConstraints() {
        textfield.height(36)
        textfield.edgesToSuperview(excluding: .trailing, insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        textfield.trailingToLeading(of: actionBtn, offset: -10)

        actionBtn.width(20)
        actionBtn.aspectRatio(1)
        actionBtn.trailingToSuperview(offset: 10)
        actionBtn.centerYToSuperview()

        divider.leadingToSuperview(offset: 10)
        divider.trailingToSuperview(offset: 10)
        divider.topToBottom(of: textfield, offset: 5)
        divider.height(1)
    }

    func configure(placeholder: String, text: String, actionBtnImage: UIImage?) {
        textfield.placeholder(text: placeholder, color: .silver40)
        textfield.text = text
        actionBtn.setImageForAllStates(actionBtnImage)
    }
}

extension AddExchangeTextFieldView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        return true
    }
}
