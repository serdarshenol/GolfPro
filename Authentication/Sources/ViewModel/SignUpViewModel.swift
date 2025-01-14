//
//  SignUpViewModel.swift
//  Next
//
//  Created by Serdar Senol on 05/01/2025.
//

import Foundation
import Combine
import CoreUI

public protocol SignUpViewModelProtocol: ViewModel {
    var email: String { get set }
    var password: String { get set }
    var confirmPassword: String { get set }
    var isSignUpActive: Bool { get }
    
    func signUpTapped()
}

public final class SignUpViewModel: BaseViewModel, SignUpViewModelProtocol {
    @Published public var email = String()
    @Published public var password = String()
    @Published public var confirmPassword = String()
    @Published public var isSignUpActive = false
    
    private let model: SignUpModel
    private let signUpPassed: () -> Void
    
    public init(
        _ model: SignUpModel,
        signUpPassed: @escaping @autoclosure () -> Void
    ) {
        self.model = model
        self.signUpPassed = signUpPassed
        
        super.init()
        
        binding()
    }
}

// MARK: - Internal Methods
extension SignUpViewModel {
    public func signUpTapped() {
        renderingState.render(.loading)
        
        model.signUp(email: email, password: password)
            .sink { [weak self] completion in
                guard case let .failure(error) = completion else {
                    self?.renderingState.render(.view)
                    self?.signUpPassed()
                    return
                }
                
                self?.renderingState.render(.error(error))
                
            } receiveValue: { _ in }
            .store(in: &subscriptions)
    }
}

// MARK: - Private Methods
private extension SignUpViewModel {
    func binding() {
        $email
            .combineLatest($password, $confirmPassword)
            .sink { [weak self] email, password, confirmPassword in
                let isEmailValid = email.count > 5
                let isPasswordValid = password.count > 5 && password == confirmPassword
                
                self?.isSignUpActive = isEmailValid && isPasswordValid
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Preview
public extension SignUpViewModel {
    static let placeholder = SignUpViewModel(
        SignUpModel(dependencies: .placeholder),
        signUpPassed: ()
    )
}
