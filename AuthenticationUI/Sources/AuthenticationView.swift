//
//  AuthSelectView.swift
//  Next
//
//  Created by Serdar Senol on 05/01/2025.
//

import SwiftUI
import Authentication

public struct AuthenticationView<ViewModel: AuthenticationViewModelProtocol>: View {

    @StateObject var viewModel: ViewModel
    
    public var body: some View {
        VStack {
            Spacer()
            image()
            Spacer()
            buttons
        }
        .padding(.horizontal)
    }
}

// MARK: - Private Methods
private extension AuthenticationView {
    @ViewBuilder
    func image() -> some View {
        Text("LOGO HERE")
    }
    
    var buttons: some View {
        VStack {
            Button("Sign In") { //TODO: Use swiftgen for localisation
                viewModel.signInTapped()
            }
            
            Button("Sign Up") {
                viewModel.signUpTapped()
            }
        }

    }
}

// MARK: - Preview Provider
#Preview {
    AuthenticationView(viewModel: AuthenticationViewModel.placeholder)
}
