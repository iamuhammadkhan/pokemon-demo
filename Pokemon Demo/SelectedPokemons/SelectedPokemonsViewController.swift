//
//  SelectedPokemonsViewController.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/13/22.
//

import UIKit
import SnapKit

final class SelectedPokemonsViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = AppConstants.Strings.searchTitle
        sb.isTranslucent = false
        sb.backgroundImage = UIImage()
        sb.searchTextField.font = UIFont.applyCommonAppFonts(10, .bold)
        return sb
    }()
    
    private let pageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = AppConstants.Strings.selectedPokemonsTitle
        label.font = UIFont.applyCommonAppFonts(12, .light)
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 120, height: 120)
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = AppConstants.Colors.appWhite
        setupSearchBar()
        setupPageTitleLabel()
        setupCollectionView()
        print(LocalDataManager.getLocalSavedData())
    }
    
    private func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(48)
            make.leading.trailing.equalToSuperview().inset(8)
            make.height.equalTo(32)
        }
    }
    
    private func setupPageTitleLabel() {
        view.addSubview(pageTitleLabel)
        pageTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(96)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(30)
        }
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(140)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SelectedPokemonCollectionViewCell.self, forCellWithReuseIdentifier: SelectedPokemonCollectionViewCell.identifier)
    }
}

extension SelectedPokemonsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LocalDataManager.getLocalSavedData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SelectedPokemonCollectionViewCell = collectionView.dequeReusableCell(for: indexPath)
        cell.configure(with: LocalDataManager.getLocalSavedData()[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width / 2) - 24
        return CGSize(width: size, height: size)
    }
}
