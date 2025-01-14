//
//  UserAuthData.swift
//  Next
//
//  Created by Serdar Senol on 02/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation

public protocol UserAuthData {
    var idToken: String { get }
    var refreshToken: String { get }
}
