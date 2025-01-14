//
//  AppConfiguration.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation

public enum AppEnvironment: String {
    case development
    case staging
    case production
}

public protocol AppConfiguration {
    var bundleId: String { get }
    var environment: AppEnvironment { get }
    var storageBaseURL: URL { get }
    var authBaseURL: URL { get }
    var tokenBaseURL: URL { get }
    var authAPIKey: String { get }
}
