//
//  HomeModel.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import Combine
import Entities

public protocol HomeModelProtocol {
    func getCards() -> AnyPublisher<[CardData], NetworkError>
}

public final class HomeModel {
    // MARK: - Private Properties
    private let dependecies: HomeDependencies
    
    // MARK: - Init
    public init(dependecies: HomeDependencies) {
        self.dependecies = dependecies
    }
}

// MARK: - HomeModel
extension HomeModel: HomeModelProtocol {
    public func getCards() -> AnyPublisher<[CardData], NetworkError> {
        dependecies.loadCardsAction()
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
