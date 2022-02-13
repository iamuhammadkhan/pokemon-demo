//
//  BaseURL.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import Foundation

final class BaseURL {
   
    private static let baseUrl = "https://pokeapi.co/api/v2/"
    
    static func getPokemonsUrl(offset: Int) -> String {
        return "\(baseUrl)pokemon?offset=\(offset)"
    }
}
