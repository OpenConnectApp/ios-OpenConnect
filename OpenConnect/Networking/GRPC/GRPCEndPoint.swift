//
//  GRPCEndPoint.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 04/04/21.
//

import Foundation

enum GRPCEndPoint {
    // Auth
    case login
    case register
    case verifyAccount

    // Private
    case connectExchange(exchange: AddExchange)
    case disconnectExchange
    case exchangeStatus
    case connectedExchanges
    case transactions

    // Public
    case exchanges
    case currencies
}
