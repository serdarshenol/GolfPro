//
//  SignUpView.swift
//  Next
//
//  Created by Serdar Senol on 05/01/2025.
//

import SwiftUI
import Authentication

struct SignUpView<ViewModel: SignUpViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            textFields()
            
            Button("Sign Up") { //TODO: localisation
                viewModel.signUpTapped()
            }
            .disabled(!viewModel.isSignUpActive)
            
            Spacer()
        }
        .navigationTitle("Sign Up") //TODO: localisation
        .padding()
        .subscribeToRenderingStates($viewModel)
    }
}

// MARK: - Private Methods
private extension SignUpView {
    @ViewBuilder
    func textFields() -> some View {
        VStack {
            TextField("Email", //TODO: localisation
                text: $viewModel.email
            )
            
            TextField("Password", //TODO: localisation
                text: $viewModel.password
            )
            
            TextField("Confirm Password", //TODO: localisation
                text: $viewModel.confirmPassword
            )
        }
    }
}

// MARK: - Preview Provider
#Preview {
    SignUpView(viewModel: SignUpViewModel.placeholder)
}
