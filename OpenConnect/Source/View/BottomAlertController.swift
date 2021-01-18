//
//  AlertController.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation
import UIKit

/// An action that can be taken when the user taps a button in an alert.
///
/// You use this class to configure information about a single action, including the title to display in the button, any styling information, and a handler to execute when the user taps the button. After creating an alert action object, add it to a AlertController object before displaying the corresponding alert to the user.
///
/// Note: style not used currently.
final class AlertAction {

    fileprivate var title: String?
    fileprivate var style: UIAlertAction.Style
    fileprivate var handler: ((AlertAction) -> Void)?
    var isEnabled: Bool = true

    init(title: String?, style: UIAlertAction.Style, handler: ((AlertAction) -> Void)? = nil) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}

/// An object that displays an alert message to the user.
///
/// Use this class to configure alerts with the message that you want to display and the actions from which to choose. After configuring the alert controller with the actions and style you want, present it using the present(_:animated:completion:) method. UIKit displays alerts and action sheets modally over your app's content.
///
/// In addition to displaying a message to a user, you can associate actions with your alert controller to give the user a way to respond. For each action you add using the addAction(_:) method, the alert controller configures a button with the action details. When the user taps that action, the alert controller executes the block you provided when creating the action object. Listing 1 shows how to configure an alert with a single action.
///
/// # Listing 1 Configuring and presenting an alert
/// ```
/// let alert = AlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
/// alert.addAction(AlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
///    NSLog("The \"OK\" alert occured.")
/// }))
/// self.present(alert, animated: true, completion: nil)
/// ```
final class OCBottomAlertController: UIViewController {

    override var title: String? {
        didSet {
            titleLabel.text = title
        }
    }

    var message: String? {
        didSet {
            messageLabel.text = message
        }
    }

    private var preferredStyle: UIAlertController.Style  = .alert
    private(set) var actions: [AlertAction] = []

    // MARK: - UI theme properties
    var alertBackgroundColor: UIColor = UIColor.darkGreyBlue {
        didSet {
            contentView.backgroundColor = alertBackgroundColor
        }
    }

    var titleTextColor: UIColor = UIColor.white {
        didSet {
            titleLabel.textColor = titleTextColor
        }
    }

    var messageTextColor: UIColor = UIColor.white {
        didSet {
            messageLabel.textColor = messageTextColor
        }
    }

    var btnTextColor: UIColor = UIColor.silver {
        didSet {
            updateAlertButtonsView()
        }
    }

//    var btnDisabledTextColor: UIColor = UIColor.white30 {
//        didSet {
//            updateAlertButtonsView()
//        }
//    }

    // MARK: - Views properties
    private var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGreyBlue
        view.layer.masksToBounds = true
        return view
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .silver
        label.font = .sectionBigTitle
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()

    private var messageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .silver40
        label.font = .bodyMedium
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    private var actionStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [])
        sv.axis = NSLayoutConstraint.Axis.vertical
        sv.alignment = UIStackView.Alignment.fill
        sv.distribution = UIStackView.Distribution.fillEqually
        return sv
    }()

    private var closeBtn: UIButton = .button(type: .custom)

    // MARK: - Initilization
    convenience init(title: String?, message: String?, preferredStyle: UIAlertController.Style = .alert) {
        self.init(nibName: nil, bundle: nil)
        self.title = title
        self.message = message
        self.preferredStyle = preferredStyle
        displayAsAlert()
        setup()
    }

    private func displayAsAlert() {
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }

    private func setup() {
        titleLabel.text = self.title
        messageLabel.text = self.message

        closeBtn.setImageForAllStates(Asset.icNavClose.image)
        closeBtn.addTarget(self, action: #selector(closeBtnTapped), for: .touchUpInside)

        self.view.addAutoSubviews([contentView])
        self.contentView.addAutoSubviews([titleLabel, messageLabel, closeBtn, actionStackView])

        contentView.edgesToSuperview(excluding: .top)

        closeBtn.width(24)
        closeBtn.aspectRatio(1)
        closeBtn.centerY(to: titleLabel)
        closeBtn.trailingToSuperview(offset: 24)

        titleLabel.leadingToSuperview(offset: 24)
        titleLabel.trailingToLeading(of: closeBtn, offset: -15)
        titleLabel.topToSuperview(offset: 24)

        messageLabel.leadingToSuperview(offset: 24)
        messageLabel.trailingToSuperview(offset: 24)
        messageLabel.topToBottom(of: self.titleLabel, offset: 20)
        messageLabel.bottomToTop(of: actionStackView, offset: -24)

        actionStackView.edgesToSuperview(excluding: .top, usingSafeArea: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.roundCorners(corners: [.topLeft, .topRight], radius: 32)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateShow()
    }

    @objc private func closeBtnTapped() {
        animateHide {
            self.dismiss(animated: true, completion: nil)
        }
    }

    private func animateShow() {
        self.contentView.layoutIfNeeded()
        let height = self.contentView.frame.height
        self.contentView.transform = CGAffineTransform(translationX: 0, y: height)
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.contentView.transform = CGAffineTransform.identity
            self.contentView.layoutIfNeeded()
        }, completion: nil)
    }

    private func animateHide(completion: @escaping (() -> Void)) {
        contentView.layoutIfNeeded()
        let height = self.contentView.frame.height
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
            self.contentView.transform = CGAffineTransform(translationX: 0, y: height)
        }, completion: { (completed) in
            completion()
        })
    }

    // MARK: View handling functions

    /// Add an action buttton to alert
    ///
    /// - Parameter action: AlertAction to display the title in the button, any styling information, and a handler to execute when the user taps the button.
    func addAction(_ action: AlertAction) {
        self.actions.append(action)
        addActionView(action: action)
    }

    // MARK: - private functions
    private func updateAlertButtonsView() {
        if let alertBtns = actionStackView.arrangedSubviews as? [UIButton] {
            for btn in alertBtns {
                btn.setTitleColorForAllStates(btnTextColor)
//                btn.setTitleColor(btnDisabledTextColor, for: .disabled)
            }
        }
    }

    private func addActionView(action: AlertAction) {
        let button = UIButton(type: .custom)
        button.setTitleForAllStates(action.title)
        button.setTitleColorForAllStates(btnTextColor)
        if action.style == .cancel {
            button.titleLabel?.font = .heading
            button.backgroundColor = .backgroundDark
        } else {
            button.titleLabel?.font = .heading
            button.backgroundColor = .warmBlue
        }
        button.addTarget(self, action: #selector(actionTapped), for: .touchUpInside)
        button.isEnabled = action.isEnabled
        button.tag = actions.count - 1
        button.contentEdgeInsets = UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 0)

//        button.height(48)
        actionStackView.addArrangedSubview(button)
    }

    @objc private func actionTapped(button: UIButton) {
        let action = actions[button.tag]
        animateHide {
            action.handler?(action)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
