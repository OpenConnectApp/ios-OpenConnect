//
//  GRPCEndPoint.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 04/04/21.
//

import Foundation

public enum GRPCEndPoint {
    // Auth
    case login
    case register
    case verifyAccount

    // Private
    case connectExchange
    case disconnectExchange
    case exchangeStatus
    case connectedExchanges
    case transactions

    // Public
    case exchanges
    case currencies
}
