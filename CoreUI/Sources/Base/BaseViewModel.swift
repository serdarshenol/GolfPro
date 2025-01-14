//
//  BaseViewModel.swift
//  Next
//
//  Created by Serdar Senol on 03/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation
import Combine

public protocol ViewModel: ObservableObject {
    var renderingState: ViewRenderingState { get set }
    var renderingStatePublisher: AnyPublisher<ViewRenderingState, Never> { get }
}

open class BaseViewModel: ViewModel {
    @Published public var renderingState: ViewRenderingState = .init()
    public lazy var renderingStatePublisher = $renderingState.eraseToAnyPublisher()
    
    public var subscriptions = Set<AnyCancellable>()
    
    public init() {}
}
