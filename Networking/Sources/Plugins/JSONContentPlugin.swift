//
//  JSONContentPlugin.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import CombineNetworking

public struct JSONContentPlugin: CNPlugin {
    // MARK: - Init
    public init() {}
}

// MARK: - Public Methods
public extension JSONContentPlugin {
    func modifyRequest(_ request: inout URLRequest) {
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
