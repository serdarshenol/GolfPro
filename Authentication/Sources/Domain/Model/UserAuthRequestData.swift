//
//  UserAuthRequestData.swift
//  GolfPro
//
//  Created by Serdar Senol on 14/01/2025.
//

import Foundation

public struct UserAuthRequestData: Encodable {
    public let email: String
    public let password: String
}
