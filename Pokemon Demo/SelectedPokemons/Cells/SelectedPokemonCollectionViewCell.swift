//
//  SelectedPokemonCollectionViewCell.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import UIKit

class SelectedPokemonCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.applyBorder()
        contentView.layer.cornerRadius = 15
    }
}
