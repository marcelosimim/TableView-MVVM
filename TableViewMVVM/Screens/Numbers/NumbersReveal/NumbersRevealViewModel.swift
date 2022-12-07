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
