//
//  HomeViewController.swift
//  GolfPro
//
//  Created by Serdar Senol on 14/01/2025.
//


import UIKit
import SwiftUI
import Entities
import Home
import CoreUI

final class HomeViewController<ViewModel: HomeViewModelProtocol>: BaseViewController<ViewModel> {
    // MARK: - Private Properties
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSwiftUIView()
        binding()
        title = "Home"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.loadCards()
    }
    
    // Create the SwiftUI view
    func setupSwiftUIView() {
        let homeView = HomeView()

        let hostingController = UIHostingController(rootView: homeView)
        
        addChild(hostingController)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)

        // Constrain the hosting controller's view to the edges of this view
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        hostingController.didMove(toParent: self)
    }
}

// MARK: - Private Methods
private extension HomeViewController {
    func binding() {
        viewModel.characters
            .sink { [weak self] cards in
                print("Received cards are: \(cards.map(\.name))")
            }
            .store(in: &subscriptions)
    }
}
