//
//  CardData.swift
//  Next
//
//  Created by Serdar Senol on 02/01/2025.
//  Copyright © 2025 com.trackman. All rights reserved.
//

import Foundation

public struct CardData: Decodable {
    public let name: String
    public let image: URL
    public let status: String
    
    public static let placeholder = CardData(
        name: "Rick Sanchez",
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
        status: "Alive"
    )
}
