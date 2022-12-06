//
//  PalindromoViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/6/22.
//

import Foundation

protocol PalindromoViewModelProtocol {
    var didFinishValidationSuccess: ((String) -> Void) { get set }
    var didFinishValidationFailure: ((String) -> Void) { get set }

    func verify(_ text: String)
}

final class PalindromoViewModel: PalindromoViewModelProtocol {
    var didFinishValidationSuccess: ((String) -> Void) = { _ in }
    var didFinishValidationFailure: ((String) -> Void) = { _ in }

    func verify(_ text: String) {
        isPalindromo(text) ? didFinishValidationSuccess("É um palíndromo!") : didFinishValidationFailure("Não é um palíndromo!")
    }

    func isPalindromo(_ text: String) -> Bool {
        let phrase = text.removeAccent().removePunctuation().removeSpacing().lowercased()
        let reversedPhrase = String(phrase.reversed())
        return phrase == reversedPhrase
    }
}
