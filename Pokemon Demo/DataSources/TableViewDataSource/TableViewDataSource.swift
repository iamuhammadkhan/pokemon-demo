//
//  TableViewDataSource.swift
//  Pokemon Demo
//
//  Created by Muhammad Khan on 2/10/22.
//

import UIKit

final class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CellType = tableView.dequeueReusableCell(for: indexPath)
        configureCell(cell, items[indexPath.row])
        return cell
    }
}
