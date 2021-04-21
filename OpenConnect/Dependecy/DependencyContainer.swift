//
//  DependencyContainer.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 04/04/21.
//

import Foundation

final class DependencyContainer: Dependency {

    static let shared = DependencyContainer()

    let grpcService: GRPCManager
    let appDataService: AppDataService
    let startupService: StartupService

    private init() {
        grpcService = GRPCManager.shared
        appDataService = AppDataServiceImpl()
        startupService = AppStartupService(
            grpcService: self.grpcService,
            appDataService: self.appDataService
        )
    }
}
