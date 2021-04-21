//
//  Constants.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 20/12/20.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import UIKit

public enum Constants {

    public enum Config {
        public static let privacyPolicyUrl = ""
        public static let termsAndConditionsUrl = ""
        public static let faqUrl = ""
        public static let appLinkScheme = "openconnect://"
        public static let host = ""
    }

    public enum Timer {
        public static let RESEND_OTP: TimeInterval = 30
    }

    public enum Screen {
        public static let width: CGFloat = UIScreen.main.bounds.width
        public static let height: CGFloat = UIScreen.main.bounds.height
    }

    public enum AppStore {
        public static let appStoreId: String = ""
        public static let appStoreUrl = "itms-apps://itunes.apple.com/app/id\(appStoreId)"
    }

    public static let retryCount = 2
    public static let defaultCallingCode = "+91"
}
