//
//  PokemonListViewModel.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import Foundation

protocol PokemonListViewModelDelegate: AnyObject {
    func dataFetched()
}

final class PokemonListViewModel {
    private lazy var pokemons: [PokemonList] = []
    private lazy var selectedPokemons: [PokemonList] = []
    private weak var delegate: PokemonListViewModelDelegate?
    
    init(_ delegate: PokemonListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getPokemonsData() {
        guard let url = URL(string: BaseURL.getPokemonsUrl(offset: pokemons.count)) else { return }
        let resource = Resource<Pokemon>(url: url, httpMethod: .get) { data in
            do {
                let parssedPokemon = try JSONDecoder().decode(Pokemon.self, from: data)
                return parssedPokemon
            } catch {
                return nil
            }
        }
        WebService.loadData(resource: resource) { [weak self] (result) in
            if let result = result {
                if self?.pokemons.isEmpty ?? true {
                    self?.pokemons = result.results
                } else {
                    self?.pokemons += result.results
                }
                self?.delegate?.dataFetched()
            }
        }
    }
    
    func numberOfPokemons() -> Int {
        return pokemons.count
    }
    
    func getPokemons() -> [PokemonList] {
        return pokemons
    }
    
    func getPokemon(index: Int) -> PokemonList? {
        return pokemons[index]
    }
    
    func updateSelectedPokemons(_ pokemon: PokemonList, append: Bool) {
        if append {
            selectedPokemons.append(pokemon)
        } else if let index = selectedPokemons.firstIndex(of: pokemon) {
            selectedPokemons.remove(at: index)
        }
    }
    
    func saveSelectedPokemons() {
        LocalDataManager.saveData(selectedPokemons)
    }
}
