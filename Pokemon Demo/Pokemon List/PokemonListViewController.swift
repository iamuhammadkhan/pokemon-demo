//
//  PokemonListViewController.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/11/22.
//

import UIKit
import SnapKit

final class PokemonListViewController: UIViewController {
    
//    private var lastContentOffset: CGFloat = 0
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.showsVerticalScrollIndicator = false
        tv.allowsMultipleSelection = true
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
        tableView.register(PokemonListTableViewCell.self, forCellReuseIdentifier: PokemonListTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc private func saveTapped() {
        navigationController?.popViewController(animated: true)
    }
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
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
    
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.lastContentOffset = scrollView.contentOffset.y
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if self.lastContentOffset < scrollView.contentOffset.y {
//            // did move up
//            print("did move up")
//        } else if self.lastContentOffset > scrollView.contentOffset.y {
//            // did move down
//            print("did move down")
//        } else {
//            // didn't move
//            print("didn't move")
//        }
//    }
}
