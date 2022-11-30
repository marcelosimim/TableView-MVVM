//
//  IMCRange.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/30/22.
//

import Foundation
import UIKit

enum IMCRange {
    case underweight
    case normal
    case overweight
    case obesity1
    case obesity2
    case obesity3

    var icon: UIImage {
        switch self {
        case .underweight:
            return .underweight
        case .normal:
            return .normal
        case .overweight:
            return .overweight
        case .obesity1:
            return .obesity1
        case .obesity2:
            return .obesity2
        case .obesity3:
            return .obesity3
        }
    }

    var title: String {
        switch self {
        case .underweight:
            return "Abaixo do peso"
        case .normal:
            return "Normal"
        case .overweight:
            return "Sobrepeso"
        case .obesity1:
            return "Obesidade I"
        case .obesity2:
            return "Obesidade II"
        case .obesity3:
            return "Obesidade III"
        }
    }
}
