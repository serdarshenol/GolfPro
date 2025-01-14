//
//  RootViewModel.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation

final class RootViewModel: ObservableObject {
    // MARK: - Internal Properties
    @Published var currentFeature: Feature
    
    let dependencies: DependenciesProtocol
    
    // MARK: - Init
    init(
        dependencies: DependenciesProtocol = Dependencies(),
        currentFeature: Feature = .auth
    ) {
        self.dependencies = dependencies
        self.currentFeature = currentFeature
    }
}

// MARK: - Models
extension RootViewModel {
    enum Feature {
        case auth
        case home
    }
}
