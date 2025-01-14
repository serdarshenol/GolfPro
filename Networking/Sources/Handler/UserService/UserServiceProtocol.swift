//
//  UserServiceProtocol.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import Entities

public protocol UserServiceProtocol: AnyObject {
    var isAuthorized: Bool { get }
    var token: String? { get }
    var refreshToken: String? { get }
    
    func save(_ model: UserAuthData)
    func clear()
}
