//
//  RootView.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import SwiftUI
import AuthenticationUI
import HomeUI
import CoreUI

struct RootView: View {
    // MARK: - Internal Properties
    @StateObject var viewModel: RootViewModel
    
    // MARK: - Body
    var body: some View {
        switch viewModel.currentFeature {
        case .auth:
            AuthenticationRoot(
                dependencies: viewModel.dependencies.authDependencies,
                signInPassed: viewModel.currentFeature = .home,
                signUpPassed: viewModel.currentFeature = .home
            )
            
        case .home:
            HomeRoot(dependencies: viewModel.dependencies.homeDependencies)
        }
    }
}
