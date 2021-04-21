//
//  Dependency.swift
//  OpenConnect
//
//  Created by Yogesh Pareek on 04/04/21.
//

import Foundation

protocol Dependency: AnyObject {
    var grpcService: GRPCManager { get }
    var appDataService: AppDataService  { get }
    var startupService: StartupService  { get }
}
