//
//  Coordinator.swift
//  Next
//
//  Created by Serdar Senol on 03/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import SwiftUI

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

// MARK: -
public extension Coordinator {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }
}

// MARK: - UIViewControllerRepresentable
public struct CoordinatorRepresentable: UIViewControllerRepresentable {
    // MARK: - Private Properties
    private let coordinator: Coordinator
    
    // MARK: - Init
    public init(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    // MARK: - Public Methods
    public func makeUIViewController(context: Context) -> UINavigationController {
        coordinator.start()
        
        return coordinator.navigationController
    }
    
    public func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {}
}
