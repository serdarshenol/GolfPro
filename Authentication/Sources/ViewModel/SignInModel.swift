//
//  SignInModel.swift
//  Next
//
//  Created by Serdar Senol on 05/01/2025.
//

import Foundation
import Combine
import Entities

public protocol SignInModelProtocol {
    func login(email: String, password: String) -> AnyPublisher<Never, NetworkError>
}

public final class SignInModel {
    public let dependencies: SignInDependencies
    
    // MARK: - Init
    public init(dependencies: SignInDependencies) {
        self.dependencies = dependencies
    }
}

// MARK: - SignInModel
extension SignInModel: SignInModelProtocol {
    public func login(email: String, password: String) -> AnyPublisher<Never, NetworkError> {
        dependencies.loginAction(email, password)
            .receive(on: DispatchQueue.main)
            .map { [weak self] (data) -> Void in
                self?.dependencies.saveAction(data)
            }
            .ignoreOutput()
            .eraseToAnyPublisher()
    }
}
