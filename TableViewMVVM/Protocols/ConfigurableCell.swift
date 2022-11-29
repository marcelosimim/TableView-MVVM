//
//  ConfigurableCell.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import Foundation

protocol ConfigurableCell {
    associatedtype DataType
    func configure(_ model: DataType)
}
