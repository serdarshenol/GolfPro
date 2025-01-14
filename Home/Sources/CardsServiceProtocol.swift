//
//  CardsServiceProtocol.swift
//  GolfPro
//
//  Created by Serdar Senol on 14/01/2025.
//

import Foundation
import Combine
import Entities

public protocol CardsServiceProtocol {
    func getCards() -> AnyPublisher<[CardData], NetworkError>
}
