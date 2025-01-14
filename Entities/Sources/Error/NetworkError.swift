//
//  NetworkError.swift
//  Next
//
//  Created by Serdar Senol on 02/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation

public struct NetworkError: AppError {
    public var localizedDescription: String
    
    public init(_ description: String) {
        localizedDescription = description
    }
}
