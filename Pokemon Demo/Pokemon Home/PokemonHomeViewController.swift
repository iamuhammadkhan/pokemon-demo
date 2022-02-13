//
//  PokemonHomeViewController.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/10/22.
//

import UIKit
import SnapKit
import FittedSheets

final class PokemonHomeViewController: UIViewController {

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = AppConstants.Strings.userName
        label.font = UIFont.applyCommonAppFonts(20)
        return label
    }()
    
    private let userAvatar: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: AppConstants.Strings.userAvatar)
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 16
        return iv
    }()
    
    private let navBarContainer: UIView = {
        return UIView()
    }()
    
    private let navBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let pokemonListButton: UIButton = {
        let button = UIButton()
        button.setTitle(AppConstants.Strings.pokemonListButton, for: .normal)
        button.setTitleColor(AppConstants.Colors.appBlack, for: .normal)
        button.titleLabel?.font = UIFont.applyCommonAppFonts(12, .bold)
        button.applyBorder(color: AppConstants.Colors.appBlack)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let selectedPokemonsButton: UIButton = {
        let button = UIButton()
        button.setTitle(AppConstants.Strings.selectedPokemonsButton, for: .normal)
        button.setTitleColor(AppConstants.Colors.appBlack, for: .normal)
        button.titleLabel?.font = UIFont.applyCommonAppFonts(12, .bold)
        button.applyBorder(color: AppConstants.Colors.appBlack)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let mainButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    private func setupViews() {
        view.backgroundColor = AppConstants.Colors.appWhite
        setupNavBar()
        setupMainStackView()
    }
    
    private func setupNavBar() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = AppConstants.Colors.appGreen
        
        view.addSubview(navBarContainer)
        navBarContainer.snp.makeConstraints { make in
            make.height.equalTo(44)
            make.top.equalTo(50)
            make.leading.trailing.equalToSuperview()
        }
        
        navBarContainer.addSubview(navBarStackView)
        navBarStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        navBarStackView.addArrangedSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width - 60)
            make.height.equalTo(32)
        }
        
        navBarStackView.addArrangedSubview(userAvatar)
        userAvatar.snp.makeConstraints { make in
            make.height.width.equalTo(32)
        }
    }
    
    private func setupMainStackView() {
        view.addSubview(mainButtonsStackView)
        mainButtonsStackView.snp.makeConstraints { make in
            make.width.equalTo(view.frame.width)
            make.top.equalTo((navigationController?.navigationBar.frame.maxY ?? 0) + 100)
            make.leading.trailing.equalToSuperview().inset(32)
        }
        
        setupPokemonListButton()
        setupSelectedPokemonsButton()
    }
    
    private func setupPokemonListButton() {
        pokemonListButton.addTarget(self, action: #selector(showPokemonListVC), for: .touchUpInside)
        mainButtonsStackView.addArrangedSubview(pokemonListButton)
        pokemonListButton.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
    }
    
    private func setupSelectedPokemonsButton() {
        selectedPokemonsButton.addTarget(self, action: #selector(showSelectedPokemons), for: .touchUpInside)
        mainButtonsStackView.addArrangedSubview(selectedPokemonsButton)
        selectedPokemonsButton.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(8)
            make.height.equalTo(44)
        }
    }
    
    @objc private func showPokemonListVC() {
        let vc = PokemonListViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func showSelectedPokemons() {
        var sheetOptions = SheetOptions()
        sheetOptions.shrinkPresentingViewController = false
        sheetOptions.setIntrinsicHeightOnNavigationControllers = true
        sheetOptions.pullBarHeight = 50
        let vc = SelectedPokemonsViewController()
        let sheet = SheetViewController(controller: vc, sizes: [.fixed(view.frame.height / 1.28)], options: sheetOptions)
        sheet.cornerRadius = 20
        sheet.overlayColor = AppConstants.Colors.appBlack.withAlphaComponent(0.01)
        sheet.contentViewController.view.layer.shadowColor = AppConstants.Colors.appBlack.cgColor
        sheet.contentViewController.view.layer.shadowOpacity = 0.1
        sheet.contentViewController.view.layer.shadowRadius = 12
        sheet.gripColor = AppConstants.Colors.appLightGrey
        sheet.gripSize = CGSize(width: 68, height: 8)
        sheet.minimumSpaceAbovePullBar = 100
        present(sheet, animated: true, completion: nil)
    }
}

