//
//  SignInView.swift
//  Next
//
//  Created by Serdar Senol on 05/01/2025.
//

import SwiftUI
import Authentication

struct SignInView<ViewModel: SignInViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 28) {
            textFields
            
            Button("Sign In") { //TODO: use localised text
                viewModel.signInTapped()
            }
            .disabled(!viewModel.isSignInActive)
            
            Spacer()
        }
        .navigationTitle("Sign In") //TODO: use localised text
        .padding([.horizontal, .vertical])
        .subscribeToRenderingStates($viewModel)
    }
    
    var textFields: some View {
        VStack {
            TextField("Enter mail", //TODO: use localised text
                text: $viewModel.email
            )
            
            TextField("Password",
                text: $viewModel.password
            )
        }
    }
}

// MARK: - Preview Provider
#Preview {
    SignInView(viewModel: SignInViewModel.placeholder)
}
