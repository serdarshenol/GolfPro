//
//  Untitled.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Combine
import Foundation
import CoreUI
import Entities

public protocol HomeViewModelProtocol: ViewModel {
    var characters: AnyPublisher<[CardData], Never> { get }

    func loadCards()
}

public final class HomeViewModel: BaseViewModel, HomeViewModelProtocol {
    public lazy var characters = charactersSubject.eraseToAnyPublisher()

    private let charactersSubject = CurrentValueSubject<[CardData], Never>([])
    private let model: HomeModelProtocol
    
    // MARK: - Init
    public init(_ model: HomeModelProtocol) {
        self.model = model
        super.init()
    }
}

// MARK: - Internal Methods
extension HomeViewModel {
    public func loadCards() {
        renderingState.render(.loading)
        
        model.getCards()
            .sink { [weak self] completion in
                guard case let .failure(error) = completion else {
                    self?.renderingState.render(.view)
                    return
                }
                
                self?.renderingState.render(.error(error))
                
            } receiveValue: { [weak self] response in
                self?.charactersSubject.value = response
            }
            .store(in: &subscriptions)
    }
}
