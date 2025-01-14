//
//  AuthSelectViewModel.swift
//  Next
//
//  Created by Serdar Senol on 05/01/2025.
//

import Foundation
import Utility

public  protocol AuthenticationViewModelProtocol: ObservableObject {
    func signInTapped()
    func signUpTapped()
}

public final class AuthenticationViewModel: AuthenticationViewModelProtocol {
    public let navigation: NavigationStore<Route>
    
    public init(navigation: NavigationStore<Route>) {
        self.navigation = navigation
    }
}

public extension AuthenticationViewModel {
    func signInTapped() {
        navigation.push(.signIn)
    }
    
    func signUpTapped() {
        navigation.push(.signUp)
    }
}

// MARK: - Placeholder
public extension AuthenticationViewModel {
    static let placeholder = AuthenticationViewModel(navigation: .init())
}
