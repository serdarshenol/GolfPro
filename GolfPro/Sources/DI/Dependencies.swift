//
//  Dependencies.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import Authentication
import AuthenticationUI
import HomeUI
import Home
import AppContainer

protocol DependenciesProtocol {
    var authDependencies: AuthModuleFactory.Dependencies { get }
    var homeDependencies: HomeModuleFactory.Dependencies { get }
}

final class Dependencies: DependenciesProtocol {
    // MARK: - Private Propertes
    private let container: AppContainerProtocol
    
    // MARK: - Internal Properties
    lazy var authDependencies = AuthModuleFactory.Dependencies(
        .init(
            loginAction: container.authService.login(email:password:),
            saveAction: container.userService.save
        ),
        .init(
            registration: container.authService.registration(email:password:),
            saveAction: container.userService.save
        )
    )
    
    lazy var homeDependencies = HomeModuleFactory.Dependencies(
        .init(loadCardsAction: container.cardsService.getCards)
    )
    
    // MARK: - Init
    init() {
        let configuration = Configuration(bundle: .main)
        
        container = AppContainer(configuration)
    }
}
