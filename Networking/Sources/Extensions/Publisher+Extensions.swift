//
//  Publisher+Extensions.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import Combine
import CombineNetworking
import Entities

public extension Publisher where Self.Failure == CNError {
    func eraseToNetworkError() -> AnyPublisher<Self.Output, NetworkError> {
        self
            .mapError { error in
                NetworkError(
                    error.description ?? CNError.unspecifiedError.description!
                )
            }
            .eraseToAnyPublisher()
    }
}
