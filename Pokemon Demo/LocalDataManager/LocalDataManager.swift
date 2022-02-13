//
//  LocalDataManager.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import Foundation

final class LocalDataManager {
    
    static func saveData(_ data: [PokemonList]) {
        var savedData = getLocalSavedData()
        savedData += data
        UserDefaults.standard.set(try? PropertyListEncoder().encode(savedData), forKey: AppConstants.LocalKeys.selectedPokemons)
    }
    
    static func getLocalSavedData() -> [PokemonList] {
        if let data = UserDefaults.standard.value(forKey: AppConstants.LocalKeys.selectedPokemons) as? Data {
            if let pokemons = try? PropertyListDecoder().decode(Array<PokemonList>.self, from: data) {
                return pokemons
            }
        }
        return []
    }
}
