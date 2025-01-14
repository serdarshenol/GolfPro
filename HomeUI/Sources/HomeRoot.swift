//
//  HomeRoot.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import SwiftUI
import CoreUI
import Utility

public struct HomeRoot: View {
    // MARK: - Private Properties
    private let coordinator: Coordinator
    
    // MARK: - Init
    public init(dependencies: HomeModuleFactory.Dependencies) {
        let coordinator = HomeCoordinator(.init())
        let factory = HomeModuleFactory(dependencies, coordinator)
        coordinator.factory = factory
        
        self.coordinator = coordinator
    }
    
    // MARK: - Body
    public var body: some View {
        CoordinatorRepresentable(coordinator)
    }
}
