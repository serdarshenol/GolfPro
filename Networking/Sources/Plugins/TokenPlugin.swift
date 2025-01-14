//
//  TokenPlugin.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import CombineNetworking

public struct TokenPlugin: CNPlugin {
    private let userService: UserServiceProtocol
    
    public init(_ userService: UserServiceProtocol) {
        self.userService = userService
    }
}

// MARK: - Public Methods
public extension TokenPlugin {
    func modifyRequest(_ request: inout URLRequest) {
        guard let url = request.url,
              let token = userService.token,
              var components = URLComponents(string: url.absoluteString) else { return }
        
        var queryItems = components.queryItems ?? []
        queryItems.append(
            URLQueryItem(name: "auth", value: token)
        )
        
        components.queryItems = queryItems
        
        guard let newURL = components.url else { return }
        request.url = newURL
    }
}
