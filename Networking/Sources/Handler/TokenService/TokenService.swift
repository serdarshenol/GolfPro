//
//  TokenService.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Combine
import CombineNetworking
import Entities

public struct TokenService: TokenServiceProtocol {
    // MARK: - Private Properties
    private let provider: CNProvider<TokenAPIRequestBuilder, NetworkingHandler>
    
    // MARK: - Init
    public init(_ provider: CNProvider<TokenAPIRequestBuilder, NetworkingHandler>) {
        self.provider = provider
    }
}

// MARK: - Public Methods
public extension TokenService {
    func refreshToken(_ model: TokenRequestData) -> AnyPublisher<UserAuthData, CNError> {
        provider.perform(
            .refreshToken(model),
            decodableType: TokenData.self
        )
    }
}
