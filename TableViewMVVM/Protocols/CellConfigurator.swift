//
//  CellConfigurator.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import Foundation
import UIKit

protocol CellConfigurator {
    static var identifier: String { get }
    func configure(cell: UIView)
}
