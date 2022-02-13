//
//  SelectedPokemonCollectionViewCell.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import UIKit
import SnapKit
import SDWebImage

class SelectedPokemonCollectionViewCell: UICollectionViewCell {
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let pokemonImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = AppConstants.Colors.appLightGrey.withAlphaComponent(0.4)
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 60
        iv.applyBorder()
        return iv
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.applyCommonAppFonts(16, .light)
        label.numberOfLines = 0
        label.text = "init(coder:) has not been implemented".capitalized
        return label
    }()
    
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
        setupStackView()
    }
    
    private func setupStackView() {
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(12)
        }
        
        mainStackView.addArrangedSubview(pokemonImage)
        pokemonImage.snp.makeConstraints { make in
            make.height.width.equalTo(120)
        }
        
        mainStackView.addArrangedSubview(pokemonNameLabel)
    }
    
    func configure(with pokemon: PokemonList) {
        pokemonNameLabel.text = pokemon.name.capitalized
        if let url = URL(string: pokemon.url) {
            pokemonImage.sd_setImage(with: url)
        }
    }
 }
