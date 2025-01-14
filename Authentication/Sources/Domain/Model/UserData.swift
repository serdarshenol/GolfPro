//
//  UserData.swift
//  GolfPro
//
//  Created by Serdar Senol on 14/01/2025.
//

import Foundation
import Entities

public struct UserData: Decodable, UserAuthData {
    public let idToken: String
    public let refreshToken: String
}
