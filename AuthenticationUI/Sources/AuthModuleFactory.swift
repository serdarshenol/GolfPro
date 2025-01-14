//
//  AuthenticationRepository.swift
//  Next
//
//  Created by Serdar Senol on 03/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation
import SwiftUI
import CoreUI
import Authentication
import Utility

public final class AuthModuleFactory {
    public struct Dependencies {
        let signInDependencies: SignInDependencies
        let signUpDependencies: SignUpDependencies
        
        public init(
            _ signIn: SignInDependencies,
            _ signUp: SignUpDependencies
        ) {
            signInDependencies = signIn
            signUpDependencies = signUp
        }
    }
    
    // MARK: - Private Properties
    private let dependencies: Dependencies
    private let navigation: NavigationStore<Route>
    
    // MARK: - Init
    init(_ dependencies: Dependencies, _ navigation: NavigationStore<Route>) {
        self.dependencies = dependencies
        self.navigation = navigation
    }
}

// MARK: - Internal Methods
extension AuthModuleFactory {
    @ViewBuilder
    func getAuthSelect() -> some View {
        AuthenticationView(
            viewModel: AuthenticationViewModel(
                navigation: self.navigation
            )
        )
    }
    
    @ViewBuilder
    func getSignIn(
        signInPassed: @escaping @autoclosure () -> Void
    ) -> some View {
        SignInView(
            viewModel: SignInViewModel(
                SignInModel(
                    dependencies: self.dependencies.signInDependencies
                ),
                signInPassed: signInPassed()
            )
        )
    }
    
    @ViewBuilder
    func getSignUp(
        signUpPassed: @escaping @autoclosure () -> Void
    ) -> some View {
        SignUpView(
            viewModel: SignUpViewModel(
                SignUpModel(
                    dependencies: self.dependencies.signUpDependencies
                ),
                signUpPassed: signUpPassed()
            )
        )
    }
}
