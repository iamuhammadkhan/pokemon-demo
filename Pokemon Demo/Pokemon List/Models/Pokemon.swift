//
//  Pokemon.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import Foundation

struct Pokemon: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonList]
}
