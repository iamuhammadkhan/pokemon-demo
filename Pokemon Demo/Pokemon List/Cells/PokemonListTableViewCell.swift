//
//  PokemonListTableViewCell.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/11/22.
//

import UIKit
import SnapKit
import SDWebImage

final class PokemonListTableViewCell: UITableViewCell {

    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .leading
        stackView.distribution = .fill
        return stackView
    }()
    
    private let pokemonImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = AppConstants.Colors.appLightGrey.withAlphaComponent(0.4)
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 20
        iv.applyBorder()
        return iv
    }()
    
    private let selectionImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = AppConstants.Colors.appWhite
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let selectionImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.applyCommonAppFonts(16, .light)
        label.numberOfLines = 0
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = AppConstants.Strings.pokemonSubTitle
        label.font = UIFont.applyCommonAppFonts(12, .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = AppConstants.Colors.appSepratorLine
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupSelectedState(selected)
    }
    
    private func setupViews() {
        selectionStyle = .none
        setupStackViews()
    }
    
    private func setupStackViews() {
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(12)
            make.bottom.equalToSuperview()
        }
        
        mainStackView.addArrangedSubview(contentStackView)
        mainStackView.addArrangedSubview(separatorLine)
        separatorLine.snp.makeConstraints { make in
            make.height.equalTo(0.5)
        }
        
        contentStackView.addArrangedSubview(pokemonImage)
        pokemonImage.snp.makeConstraints { make in
            make.height.width.equalTo(40)
        }
        
        contentStackView.addArrangedSubview(titleStackView)
        contentStackView.addArrangedSubview(selectionImageContainer)
        selectionImageContainer.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
        
        selectionImageContainer.addSubview(selectionImage)
        selectionImage.snp.makeConstraints { make in
            make.height.width.equalTo(12)
            make.center.equalToSuperview()
        }
        
        titleStackView.addArrangedSubview(pokemonNameLabel)
        titleStackView.addArrangedSubview(subTitleLabel)
    }
    
    private func setupSelectedState(_ selected: Bool) {
        selectionImageContainer.applyBorder(color: selected ? AppConstants.Colors.appGreen : AppConstants.Colors.appLightGreyBorder)
        selectionImage.image = selected ? UIImage(named: AppConstants.Strings.selectionTickImage) : nil
    }
    
    func configure(with pokemon: PokemonList) {
        pokemonNameLabel.text = pokemon.name
        if let url = URL(string: pokemon.url) {
            pokemonImage.sd_setImage(with: url)
        }
    }
}
