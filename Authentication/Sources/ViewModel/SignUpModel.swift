//
//  SignUpModel.swift
//  Next
//
//  Created by Serdar Senol on 05/01/2025.
//

import Foundation
import Combine
import Entities

public protocol SignUpModelProtocol {
    func signUp(email: String, password: String) -> AnyPublisher<Never, NetworkError>
}

public final class SignUpModel {
    public let dependencies: SignUpDependencies

    public init(dependencies: SignUpDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - SignUpModel
extension SignUpModel: SignUpModelProtocol {
    public func signUp(email: String, password: String) -> AnyPublisher<Never, NetworkError> {
        dependencies.registration(email, password)
            .receive(on: DispatchQueue.main)
            .map { [weak self] (data) -> Void in
                self?.dependencies.saveAction(data)
            }
            .ignoreOutput()
            .eraseToAnyPublisher()
    }
}
