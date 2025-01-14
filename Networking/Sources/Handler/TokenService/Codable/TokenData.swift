//
//  TokenData.swift
//  GolfPro
//
//  Created by Serdar Senol on 13/01/2025.
//

import Foundation
import Entities

public struct TokenData: Decodable, UserAuthData {
    // MARK: - Public Properties
    public let idToken: String
    public let refreshToken: String
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case idToken = "id_token"
        case refreshToken = "refresh_token"
    }
    
    // MARK: - Init
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idToken = try container.decode(String.self, forKey: .idToken)
        refreshToken = try container.decode(String.self, forKey: .refreshToken)
    }
}
