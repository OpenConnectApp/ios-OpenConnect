//
//  GRPCManager.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 04/04/21.
//

import Foundation
import GRPC
import SwiftProtobuf

class GRPCManager {

    static var shared: GRPCManager = GRPCManager()

    private lazy var channel = ClientConnection
        .insecure(group: PlatformSupport.makeEventLoopGroup(loopCount: 1))
        .connect(host: Constants.Config.host, port: Constants.Config.port)

    private lazy var authClient = Auth_AuthServiceClient(
        channel: channel,
        defaultCallOptions: CallOptions(),
        interceptors: nil
    )

    private lazy var privateClient = PrivateDataService_PrivateDataServiceClient(
        channel: channel,
        defaultCallOptions: CallOptions(),
        interceptors: nil
    )

    private lazy var publicClient = PublicDataService_PublicDataServiceClient(
        channel: channel,
        defaultCallOptions: CallOptions(),
        interceptors: nil
    )

    private init() {

    }

    typealias ResultType<T: Any> = (Result<T, Error>)

    func execute<T: Any>(type: GRPCEndPoint, objectType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        switch type {
        case .login:
            login(completion: completion)
        case .register:
            register(completion: completion)
        case .verifyAccount:
            verifyAccount()

        case .connectExchange(let exchange):
            connectExchange(exchange: exchange, completion: completion)
        case .disconnectExchange:
            disconnectExchange()
        case .connectedExchanges:
            connectedExchanges()
        case .exchangeStatus:
            exchangeStatus()
        case .transactions:
            transactions(completion: completion)

        case .exchanges:
            exchanges(completion: completion)
        case .currencies:
            currencies(completion: completion)
        }
    }

    private func dispatchOnMainQueue(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
}

extension GRPCManager {

    private func login<T>(completion: @escaping (Result<T, Error>)  -> Void) {
        let request: Auth_LoginRequest = .with { (request) in
            request.email = ""
            request.password = ""
        }
        let call = authClient.login(request)
        do {
            let login = try call.response.wait()
            dispatchOnMainQueue {
                completion(.success(login  as! T))
            }
        } catch {
            dispatchOnMainQueue {
                completion(.failure(error))
            }
        }
    }

    private func register<T>(completion: @escaping (Result<T, Error>)  -> Void) {
        let request: Auth_RegisterRequest = .with { (request) in
            request.email = ""
            request.password = ""
        }
        let call = authClient.register(request)
        do {
            let register = try call.response.wait()
            dispatchOnMainQueue {
                completion(.success(register as! T))
            }
        } catch {
            dispatchOnMainQueue {
                completion(.failure(error))
            }
        }

    }

    private func verifyAccount() {

    }
}

extension GRPCManager {

    private func connectExchange<T>(exchange: AddExchange, completion: @escaping (Result<T, Error>) -> Void) {
        let request: PrivateDataService_ConnectExchangeRequest = .with { (request) in
            request.apiKey = exchange.apiKey
            request.apiSecret = exchange.apiSecret
            request.portfolioName = exchange.profileName
            request.importTransactions = exchange.importPastTransactions
        }
        let call = privateClient.connectExchange(request)
        do {
            let exchange = try call.response.wait()
            dispatchOnMainQueue {
                completion(.success(exchange as! T))
            }
        } catch {
            dispatchOnMainQueue {
                completion(.failure(error))
            }
        }
    }

    private func disconnectExchange() {

    }

    private func exchangeStatus() {

    }

    private func connectedExchanges() {

    }

    private func transactions<T>(completion: @escaping (Result<T, Error>) -> Void) {
        let request: PrivateDataService_GetTransactionsRequest = .with { (request) in
        }
        let call = privateClient.getTransactions(request)
        do {
            let transactions = try call.response.wait()
            dispatchOnMainQueue {
                completion(.success(transactions as! T))
            }
        } catch {
            dispatchOnMainQueue {
                completion(.failure(error))
            }
        }
    }
}

extension GRPCManager {

    private func exchanges<T>(completion: @escaping (Result<T, Error>) -> Void) {
        let request: PublicDataService_ListExchangesRequest = .with { (request) in
            request.sortBy = .exchangeID
            request.enabled = true
        }
        let call = publicClient.listExchanges(request)
        do {
            let exchanges = try call.response.wait()
            dispatchOnMainQueue {
                completion(.success(exchanges as! T))
            }
        } catch {
            dispatchOnMainQueue {
                completion(.failure(error))
            }
        }
    }

    private func currencies<T>(completion: @escaping (Result<T, Error>) -> Void) {
        let request: PublicDataService_ListCurrenciesRequest = .with { (request) in
            request.sortBy = .currencyID
            request.enabled = true
        }
        let call = publicClient.listCurrencies(request)
        do {
            let currencies = try call.response.wait()
            dispatchOnMainQueue {
                completion(.success(currencies as! T))
            }
        } catch {
            dispatchOnMainQueue {
                completion(.failure(error))
            }
        }
    }
}

