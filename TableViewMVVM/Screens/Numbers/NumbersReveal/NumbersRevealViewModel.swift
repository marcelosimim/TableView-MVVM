//
//  NumbersRevealViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import Foundation

protocol NumbersRevealViewModelProtocol {
    func choosePhrase(_ number: Double?) -> String
}

final class NumbersRevealViewModel: NumbersRevealViewModelProtocol {
    private let phrases: [Phrases] = [.double, .square, .half, .month, .sum, .idk, .random]

    func choosePhrase(_ number: Double?) -> String {
        guard let phrase = phrases.randomElement() else { return "" }
        return phrase.operation(number)
    }
}

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
        guard let number = number else { return "O número informado não corresponde a um mês válido" }
        return "O número informado corresponde ao mês \(String(describing: Month(rawValue: Int(number))))"
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

enum Month: Int {
    case january = 1
    case february = 2
    case march = 3
    case april = 4
    case may = 5
    case june = 6
    case july = 7
    case august = 8
    case september = 9
    case october = 10
    case november = 11
    case december = 12
}
