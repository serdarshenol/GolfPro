//
//  AuthenticationRoot.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import SwiftUI
import CoreUI
import Authentication
import Utility

public struct AuthenticationRoot: View {
    // MARK: - Private Properties
    @StateObject private var navigation: NavigationStore<Route>
    
    private let factory: AuthModuleFactory
    private let signInPassed: () -> Void
    private let signUpPassed: () -> Void
    
    // MARK: - Init
    public init(
        dependencies: AuthModuleFactory.Dependencies,
        signInPassed: @escaping @autoclosure () -> Void,
        signUpPassed: @escaping @autoclosure () -> Void
    ) {
        let navigation = NavigationStore<Route>()
        _navigation = StateObject(wrappedValue: navigation)
        
        factory = AuthModuleFactory(
            dependencies,
            navigation
        )
        
        self.signInPassed = signInPassed
        self.signUpPassed = signUpPassed
    }
    
    // MARK: - Body
    public var body: some View {
        NavigationStack(path: $navigation.route) {
            factory.getAuthSelect()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .signIn:
                        factory.getSignIn(
                            signInPassed: signInPassed()
                        )
                        
                    case .signUp:
                        factory.getSignUp(
                            signUpPassed: signUpPassed()
                        )
                    }
                }
        }
    }
}

// MARK: - Preview Provider
#Preview {
    AuthenticationRoot(
        dependencies: .init(.placeholder, .placeholder),
        signInPassed: (),
        signUpPassed: ()
    )
}
