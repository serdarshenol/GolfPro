//
//  AppError.swift
//  Next
//
//  Created by Serdar Senol on 02/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation

public protocol AppError: Error {
    var localizedDescription: String { get }
}
