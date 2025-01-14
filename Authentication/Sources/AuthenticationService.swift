//
//  AuthenticationService.swift
//  Next
//
//  Created by Serdar Senol on 11/12/2024.
//  Copyright © 2024 com.trackman. All rights reserved.
//

import Foundation
import Combine
import CombineNetworking
import Entities
import Networking

public struct AuthService: AuthServiceProtocol {
    // MARK: - Private Properties
    private let provider: CNProvider<AuthAPIRequestBuilder, NetworkingHandler>
    
    // MARK: - Init
    public init(_ provider: CNProvider<AuthAPIRequestBuilder, NetworkingHandler>) {
        self.provider = provider
    }
}

// MARK: - Public Methods
public extension AuthService {
    func login(email: String, password: String) -> AnyPublisher<UserAuthData, NetworkError> {
        provider.perform(
            .login(
                .init(email: email, password: password)
            ),
            decodableType: UserData.self
        )
        .eraseToNetworkError()
    }
    
    func registration(email: String, password: String) -> AnyPublisher<UserAuthData, NetworkError> {
        provider.perform(
            .registration(
                .init(email: email, password: password)
            ),
            decodableType: UserData.self
        )
        .eraseToNetworkError()
    }
}
