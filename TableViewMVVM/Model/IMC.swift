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
    var value: Double?
    var range: IMCRange?

    init(weight: Double, height: Double) {
        self.weight = weight
        self.height = height
        calculateValue()
    }

    private mutating func calculateValue() {
        value = weight/pow(height/100, 2)
        calculateRange()
    }

    private mutating func calculateRange() {
        guard let value = value else { return }
        if value < 18.5 {
            range = .underweight
        } else if value >= 18.5 && value < 24.9 {
            range = .normal
        } else if value < 29.9 {
            range = .overweight
        } else if value < 34.9 {
            range = .obesity1
        } else if value < 39.9 {
            range = .obesity2
        } else {
            range = .obesity3
        }
    }
}
