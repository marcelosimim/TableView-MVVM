//
//  Weekday.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import Foundation

enum Weekday: Int {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thrusday = 5
    case friday = 6
    case saturday = 7

    var title: String {
        switch self {
        case .sunday:
            return "Domingo"
        case .monday:
            return "Segunda-feira"
        case .tuesday:
            return "Terça-feira"
        case .wednesday:
            return "Quarta-feira"
        case .thrusday:
            return "Quinta-feira"
        case .friday:
            return "Sexta-feira"
        case .saturday:
            return "Sábado"
        }
    }
}
