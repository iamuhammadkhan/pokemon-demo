//
//  AppConstants.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/11/22.
//

import UIKit

struct AppConstants {
    struct Colors {
        /// #FFFFFF
        static let appWhite = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        /// #000000
        static let appBlack = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        /// #1BEF9E
        static let appGreen = UIColor(red: 0.1, green: 0.9, blue: 0.6, alpha: 1)
        /// #F8F8F8
        static let appContainerGrey = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1)
        /// #EAEDF3
        static let appLightGreyBorder = UIColor(red: 0.91, green: 0.92, blue: 0.95, alpha: 1)
        /// #BFC4CE
        static let appSepratorLine = UIColor(red: 0.74, green: 0.76, blue: 0.8, alpha: 1)
        /// #ECECEC
        static let appLightGrey = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    }
    
    struct Strings {
        static let saveButton = "save"
        static let userAvatar = "avatar"
        static let userName = "Hello World"
        static let pokemonSubTitle = "Meta • Meta"
        static let pokemonListButton = "Pokemon List"
        static let selectedPokemonsButton = "Selected Pokemons"
        static let selectedPokemonsTitle = "Selected pokemons"
        static let pokemonListPageTitle = "Pokemon List"
        static let selectionTickImage = "tick"
        static let searchTitle = "Search"
    }
}
