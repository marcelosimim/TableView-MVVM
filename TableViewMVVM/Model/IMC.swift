//
//  IMC.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/30/22.
//

import Foundation

struct IMC {
    let weight: Double
    let height: Double
    var range: IMCRange?
    var value: Double?

    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
    }
}
