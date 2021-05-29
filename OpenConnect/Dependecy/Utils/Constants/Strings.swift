//
//  Strings.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

/// this is used for String constants
/// eg.
/// enum Strings {
///      static let placeholder = "Enter email or mobile number"
///  }
///
public enum Strings {

    public enum NavigationTitle {
        public static let home = "Home"
        public static let selectExchange = "Select your Exchange"
        public static let selectCurrency = "Select Currency"
        public static let settings = "Settings"
    }

    public enum Button {
        public static let signIn = "SIGN IN"
        public static let edit = "EDIT"
        public static let help = "HELP"
        public static let skip = "SKIP"
        public static let okay = "OKAY"
        public static let dismiss = "DISMISS"
        public static let close = "CLOSE"
        public static let yes = "YES"
        public static let no = "NO"
        public static let cancel = "CANCEL"
    }

    public enum Error {
        public static let defaultTitle = "Error"
        public static let defaultErrorMessage = "Oops! Our engineers are trying to fix\nit as soon as possible"
        // "Something went wrong. Please try again later."
        public static let noInternetConnection = "No internet. Please check your network connection."
    }

    public enum EmptyStateTitle {
        public static let noNetwork = "No Internet Connection"
        public static let somethingWentWrong = "Something Went Wrong"
    }

    public enum EmptyStateMessage {
        public static let noNetwork = "Check your internet connection\nand try again"
        public static let somethingWentWrong = "Oops! Our engineers are trying to fix\nit as soon as possible"
    }

    public enum AddExchangeScreen {
        public static let message = "If you import past transactions, we’ll not only import transactions that happen from now on but also import your transaction history"
    }
}
