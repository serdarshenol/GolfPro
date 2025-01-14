//
//  CardsService.swift
//  GolfPro
//
//  Created by Serdar Senol on 14/01/2025.
//

import Foundation
import Combine
import CombineNetworking
import Entities
import Networking

public struct CardsService: CardsServiceProtocol {
    // MARK: - Private Properties
    private let provider: CNProvider<CardsAPIRequestBuilder, NetworkingHandler>
    
    // MARK: - Init
    public init(_ provider: CNProvider<CardsAPIRequestBuilder, NetworkingHandler>) {
        self.provider = provider
    }
}

// MARK: - Public Methods
public extension CardsService {
    func getCards() -> AnyPublisher<[CardData], NetworkError> {
        provider.perform(.getCards)
            .eraseToNetworkError()
    }
}
