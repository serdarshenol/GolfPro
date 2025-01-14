//
//  AuthenticationService.swift
//  Next
//
//  Created by Serdar Senol on 11/12/2024.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import Foundation
import Combine
import Entities

public protocol AuthServiceProtocol {
    func login(email: String, password: String) -> AnyPublisher<UserAuthData, NetworkError>
    func registration(email: String, password: String) -> AnyPublisher<UserAuthData, NetworkError>
}
