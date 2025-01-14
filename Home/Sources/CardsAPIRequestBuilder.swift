//
//  CardsAPIRequestBuilder.swift
//  GolfPro
//
//  Created by Serdar Senol on 14/01/2025.
//

import Foundation
import CombineNetworking

public enum CardsAPIRequestBuilder: CNRequestBuilder {
    case getCards
    
    // MARK: - Public Properties
    public var path: String { "/results.json" }
    public var query: QueryItems? { nil }
    public var body: Data? { nil }
    public var method: HTTPMethod { .get }
}
