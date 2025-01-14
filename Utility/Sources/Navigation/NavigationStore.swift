//
//  NavigationStore.swift
//  Next
//
//  Created by Serdar Senol on 03/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation

public final class NavigationStore<Route: Hashable>: ObservableObject {
    // MARK: - Public Properties
    @Published public var route = [Route]()
    
    // MARK: - Init
    public init() {}
}

// MARK: - Public Methods
public extension NavigationStore {
    func pop() {
        route.removeLast()
    }
    
    func push(_ route: Route) {
        self.route.append(route)
    }
    
    func popToRoot() {
        route.removeAll()
    }
}
