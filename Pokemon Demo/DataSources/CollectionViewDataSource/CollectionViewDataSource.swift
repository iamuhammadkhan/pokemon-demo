//
//  CollectionViewDataSource.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/10/22.
//

import UIKit

final class CollectionViewDataSource<CellType, ViewModel>: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout where CellType: UICollectionViewCell {
    var items: [ViewModel]
    let configureCell: (CellType, ViewModel) -> Void
    
    init(items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> Void) {
        self.configureCell = configureCell
        self.items = items
    }
    
    func updateItems(items: [ViewModel], page: Int = 1) {
        if page > 1 {
            self.items += items
        } else {
            self.items = items
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CellType = collectionView.dequeReusableCell(for: indexPath)
        configureCell(cell, items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
