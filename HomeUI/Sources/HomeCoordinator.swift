//
//  HomeCoordinator.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import CoreUI
import UIKit
import Utility

final class HomeCoordinator: Coordinator {
    // MARK: - Internal Properties
    var navigationController: UINavigationController
    var factory: HomeModuleFactory!
    
    // MARK: - Init
    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - Internal Properties
extension HomeCoordinator {
    func start() {
        let vc = factory.getHome()
        navigationController.setViewControllers([vc], animated: false)
    }
}
