//
//  BaseViewController.swift
//  Next
//
//  Created by Serdar Senol on 03/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import UIKit
import Combine

open class BaseViewController<VM: ViewModel>: UIViewController {
    // MARK: - Public Properties
    private(set) public var viewModel: VM
    public var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Internal Properties
    var alert: UIAlertController?
    
    // MARK: - Init
    public init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    open override func viewDidLoad() {
        subscribeToRenderingStates()
    }
}
