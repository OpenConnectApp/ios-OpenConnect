//
//  ProfileTransactionsInteractor.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 18/01/21.
//  Copyright © 2020 OpenConnect. All rights reserved.
//

import Foundation

final class ProfileTransactionsInteractor: ProfileTransactionsInteractorInput {
    
    // MARK: Properties
    weak var presenter: ProfileTransactionsInteractorOutput?
    private var grpcService: GRPCManager
    
    // MARK: Initialization
    init(grpcService: GRPCManager) {
        self.grpcService = grpcService
    }
    
    // MARK: ProfileTransactionsInteractorInput methods
    func loadTransactions() {
        grpcService.execute(type: .transactions, objectType: PrivateDataService_GetTransactionsResponse.self) { [weak self] (result) in
            guard let self = self else {
                return
            }

            switch result {
            case .success(let response):
                print(response.data.count)
                self.presenter?.loadTransactionsSuccess()
            case .failure(let error):
                self.presenter?.loadTransactionsError(error)
            }
        }
    }
}
