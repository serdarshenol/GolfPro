//
//  HomeDependencies.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import Combine
import Entities

public struct HomeDependencies {
    // MARK: - Internal Properties
    var loadCardsAction: () -> AnyPublisher<[CardData], NetworkError>
    
    // MARK: - Init
    public init(
        loadCardsAction: @escaping () -> AnyPublisher<[CardData], NetworkError>
    ) {
        self.loadCardsAction = loadCardsAction
    }
}
