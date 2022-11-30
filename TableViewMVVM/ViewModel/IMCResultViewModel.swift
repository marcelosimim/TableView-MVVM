//
//  IMCResultViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/30/22.
//

import Foundation

protocol IMCResultViewModelProtocol {
    var didFinishCalculation: ((IMC) -> Void) { get set }

    func calculate(_ imc: IMC)
}

final class IMCResultViewModel: IMCResultViewModelProtocol {
    private var imc: IMC?
    var didFinishCalculation: ((IMC) -> Void) = { _ in }

    func calculate(_ imc: IMC) {
        self.imc = imc
        let weight = imc.weight
        let height = imc.height
        let result = weight/pow(height/100, 2)
        defineRange(result)
    }

    private func defineRange(_ value: Double) {
        var range: IMCRange?

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

        imc?.value = value
        imc?.range = range

        guard let imc = imc else { return }
        didFinishCalculation(imc)
    }
}
