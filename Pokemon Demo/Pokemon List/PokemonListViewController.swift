//
//  PokemonListViewController.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/11/22.
//

import UIKit
import SnapKit

final class PokemonListViewController: UIViewController {
        
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.allowsMultipleSelection = true
        return tv
    }()
    
    private lazy var viewModel: PokemonListViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = AppConstants.Colors.appWhite
        setupNavBar()
        setupTableView()
        viewModel = PokemonListViewModel(self)
        viewModel?.getPokemonsData()
    }
    
    private func setupNavBar() {
        navigationItem.title = AppConstants.Strings.pokemonListPageTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: AppConstants.Strings.saveButton, style: .plain, target: self, action: #selector(saveTapped))
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(navigationController?.navigationBar.frame.maxY ?? 0)
            make.leading.trailing.bottom.equalToSuperview()
        }
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func saveTapped() {
        viewModel?.saveSelectedPokemons()
        navigationController?.popViewController(animated: true)
    }
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfPokemons() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let pokemon = viewModel?.getPokemon(index: indexPath.row) {
            cell.configure(with: pokemon)
        }
        return cell
    }
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == ((viewModel?.numberOfPokemons() ?? 0) - 4) {
            viewModel?.getPokemonsData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? PokemonListTableViewCell else { return }
        if let pokemon = viewModel?.getPokemon(index: indexPath.row) {
            viewModel?.updateSelectedPokemons(pokemon, append: cell.isSelected)
        }
    }
}

extension PokemonListViewController: PokemonListViewModelDelegate {
    func dataFetched() {
        tableView.reloadData()
    }
}
