//
//  AppContainer.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import Swinject
import CombineNetworking
import Networking
import Entities
import Authentication
import Home

public protocol AppContainerProtocol: AnyObject {
    var userService: UserServiceProtocol { get }
    var authService: AuthServiceProtocol { get }
    var cardsService: CardsServiceProtocol { get }
}

public final class AppContainer: AppContainerProtocol {
    // MARK: - Public Properties
    public var userService: UserServiceProtocol { resolve() }
    public var authService: AuthServiceProtocol { resolve() }
    public var cardsService: CardsServiceProtocol { resolve() }

    // MARK: - Private Properties
    private let swinject = Container()
    private let configuration: AppConfiguration

    // MARK: - Init
    public init(_ configuration: AppConfiguration) {
        self.configuration = configuration

        registerServices()
    }
}

// MARK: - Private Methods
private extension AppContainer {
    func registerServices() {
        registerUserService()
        registerTokenPlugin()
        registerNetworkingHandler()
        registerTokenService()
        registerAuthService()
        registerCardsService()

    }

    func resolve<T>() -> T {
        swinject.resolve(T.self)!
    }

    func registerUserService() {
        swinject.register(UserServiceProtocol.self) { [unowned self] resolver in
            return UserService(bundleId: configuration.bundleId)
        }
        .inObjectScope(.container)
    }

    func registerTokenPlugin() {
        swinject.register(TokenPlugin.self) { resolver in
            let userService = resolver.resolve(UserServiceProtocol.self)!

            return TokenPlugin(userService)
        }
    }

    func registerNetworkingHandler() {
        swinject.register(NetworkingHandler.self) { _ in
            NetworkingHandler()
        }
        .initCompleted { resolver, handler in
            handler.tokenService = resolver.resolve(TokenServiceProtocol.self)!
            handler.userService = resolver.resolve(UserServiceProtocol.self)!
        }
    }

    func registerTokenService() {
        swinject.register(TokenServiceProtocol.self) { [unowned self] resolver in
            let networkingHandler = resolver.resolve(NetworkingHandler.self)!
            let jsonPugin = JSONContentPlugin()
            let keyPlugin = APIKeyPlugin(
                key: configuration.authAPIKey
            )

            let provider = CNProvider(
                baseURL: configuration.tokenBaseURL,
                errorHandler: networkingHandler,
                requestBuilder: TokenAPIRequestBuilder.self,
                plugins: [jsonPugin, keyPlugin]
            )

            return TokenService(provider)
        }
    }
    
    func registerCardsService() {
        swinject.register(CardsServiceProtocol.self) { [unowned self] resolver in
            let networkingHandler = resolver.resolve(NetworkingHandler.self)!
            let tokenPlugin = resolver.resolve(TokenPlugin.self)!
            let jsonPugin = JSONContentPlugin()

            let provider = CNProvider(
                baseURL: configuration.storageBaseURL,
                errorHandler: networkingHandler,
                requestBuilder: CardsAPIRequestBuilder.self,
                plugins: [jsonPugin, tokenPlugin]
            )

            return CardsService(provider)
        }
    }

    func registerAuthService() {
        swinject.register(AuthServiceProtocol.self) { [unowned self] resolver in
            let networkingHandler = resolver.resolve(NetworkingHandler.self)!
            let jsonPugin = JSONContentPlugin()
            let keyPlugin = APIKeyPlugin(
                key: configuration.authAPIKey
            )

            let provider = CNProvider(
                baseURL: configuration.authBaseURL,
                errorHandler: networkingHandler,
                requestBuilder: AuthAPIRequestBuilder.self,
                plugins: [jsonPugin, keyPlugin]
            )

            return AuthService(provider)
        }
    }
}
