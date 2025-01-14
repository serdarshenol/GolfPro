//
//  LoadingView.swift
//  Next
//
//  Created by Serdar Senol on 03/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import UIKit
import SwiftUI
import Combine
//import Resources

final public class LoadingView: UIView {
    // MARK: - Public Properties
    @Published public var isLoading: Bool = false
    
    // MARK: - Private Properties
    private let indicator = UIActivityIndicatorView(style: .large)
    private var subscription: AnyCancellable?
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
private extension LoadingView {
    func commonInit() {
        backgroundColor = .gray //TODO: use token
        
        indicator.color = .black //TODO: use token
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(indicator)
        indicator.centerXAnchor
            .constraint(equalTo: centerXAnchor)
            .isActive = true
        
        indicator.centerYAnchor
            .constraint(equalTo: centerYAnchor)
            .isActive = true
        
        binding()
    }
    
    func binding() {
        subscription = $isLoading
            .sink { [weak indicator] isLoading in
                isLoading ? indicator?.startAnimating() : indicator?.stopAnimating()
            }
    }
}

// MARK: - LoadingView + SwiftUI
struct Loader: UIViewRepresentable {
    @Binding public var isLoading: Bool
    
    public func makeUIView(context: Context) -> LoadingView {
        LoadingView()
    }
    
    public func updateUIView(_ uiView: LoadingView, context: Context) {
        uiView.isLoading = isLoading
    }
}

public extension LoadingView {
    @ViewBuilder
    static func swiftUIView(isLoading: Binding<Bool>) -> some View {
        Loader(isLoading: isLoading)
    }
}

// MARK: - Static Properties
private struct C {
    static let backgroundAlpha = 0.5
}
