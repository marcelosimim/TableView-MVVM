//
//  Phrases.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import Foundation

enum Phrases {
    case double
    case square
    case half
    case month
    case sum
    case idk
    case chuckNorris
    case random

    func operation(_ number: Double?) -> String {
        switch self {
        case .double:
            return "O dobro do valor é \((number ?? 0)*2)"
        case .square:
            return "A raiz quadrada de \(number ?? 0) é \(String(format: "%.2f", number?.squareRoot() ?? 0))"
        case .half:
            return "A metade é \((number ?? 0)/2)"
        case .month:
            return monthCalculation(number)
        case .sum:
            return sumCalculation(number)
        case .idk:
            return "Não faço a menor ideia de que número é esse"
        case .chuckNorris:
            return "Quando o Bicho Papão vai dormir, ele deixa a luz acesa com medo de Chuck Norris"
        case .random:
            return "100 perceber 20 trazer 1 amizade 100 fim!"
        }
    }

    private func monthCalculation(_ number: Double?) -> String {
        guard let number = number, let month = Month(rawValue: Int(number)) else { return "O número informado não corresponde a um mês válido" }
        return "O número informado corresponde ao mês \(String(describing: month)))"
    }

    private func sumCalculation(_ number: Double?) -> String {
        guard let number = number else { return "A soma de todos os numeros é" }
        let numberString = "\(number)"
        var sum = 0
        for i in numberString {
            sum += Int("\(i)") ?? 0
        }
        return "A soma de todos os numeros é \(sum)"
    }
}
