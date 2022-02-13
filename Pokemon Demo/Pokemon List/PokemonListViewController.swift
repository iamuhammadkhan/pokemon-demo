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
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = AppConstants.Colors.appWhite
        setupNavBar()
        setupTableView()
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
    }
    
    @objc private func saveTapped() {
        navigationController?.popViewController(animated: true)
    }
}
