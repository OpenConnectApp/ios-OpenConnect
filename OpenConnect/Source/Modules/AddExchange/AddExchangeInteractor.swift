//
//  AddExchangeInteractor.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class AddExchangeInteractor: AddExchangeInteractorInput {
    
    // MARK: Properties
    weak var presenter: AddExchangeInteractorOutput?
    private var grpcService: GRPCManager
    
    // MARK: Initialization
    init(grpcService: GRPCManager) {
        self.grpcService = grpcService
    }
    
    // MARK: AddExchangeInteractorInput methods
    func addExchange(exchange: AddExchange) {
        grpcService.execute(type: .connectExchange(exchange: exchange), objectType: PrivateDataService_ConnectExchangeResponse.self) { [weak self] (result) in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let response):
                print(response.message)
                self.presenter?.addExchangeSuccess()
            case .failure(let error):
                self.presenter?.addExchangeError(error: error)
            }
        }
    }
}
