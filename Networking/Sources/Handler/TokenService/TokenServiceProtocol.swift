//
//  TokenServiceProtocol.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Combine
import CombineNetworking
import Entities

public protocol TokenServiceProtocol {
    func refreshToken(_ model: TokenRequestData) -> AnyPublisher<UserAuthData, CNError>
}
