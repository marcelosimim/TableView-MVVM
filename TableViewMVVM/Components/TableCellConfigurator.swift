//
//  TableCellConfigurator.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import Foundation
import UIKit

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UITableViewCell {
    static var identifier: String { String(describing: CellType.self) }
    let item: DataType

    init(item: DataType) {
        self.item = item
    }

    func configure(cell: UIView) {
        (cell as! CellType).configure(item)
    }
}
