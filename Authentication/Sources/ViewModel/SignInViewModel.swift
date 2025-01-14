//
//  SignInViewModel.swift
//  Next
//
//  Created by Serdar Senol on 03/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation
import Combine
import CoreUI

public protocol SignInViewModelProtocol: ViewModel {
    var email: String { get set }
    var password: String { get set }
    var isSignInActive: Bool { get }
    
    func signInTapped()
}

public final class SignInViewModel: BaseViewModel, SignInViewModelProtocol {
    @Published public var email = String()
    @Published public var password = String()
    @Published public var isSignInActive = false
    
    private let model: SignInModel
    private let signInPassed: () -> Void
    
    public init(
        _ model: SignInModel,
        signInPassed: @escaping @autoclosure () -> Void
    ) {
        self.model = model
        self.signInPassed = signInPassed
        
        super.init()
        
        binding()
    }
}

extension SignInViewModel {
    public func signInTapped() {
        renderingState.render(.loading)
        
        model.login(email: email, password: password)
            .sink { [weak self] completion in
                guard case let .failure(error) = completion else {
                    self?.renderingState.render(.view)
                    self?.signInPassed()
                    return
                }
                
                self?.renderingState.render(.error(error))
                
            } receiveValue: { _ in }
            .store(in: &subscriptions)
    }
}

private extension SignInViewModel {
    func binding() {
        $email.combineLatest($password)
            .sink { [weak self] email, password in
                let isEmailValid = email.count > 5
                let isPasswordValid = password.count > 5
                
                self?.isSignInActive = isEmailValid && isPasswordValid
            }
            .store(in: &subscriptions)
    }
}

// MARK: - Preview
extension SignInViewModel {
    public static let placeholder = SignInViewModel(
        SignInModel(dependencies: .placeholder),
        signInPassed: ()
    )
}
