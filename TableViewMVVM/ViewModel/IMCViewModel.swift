//
//  IMCViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import Foundation

protocol IMCViewModelProtocol {
    var didFinishValidation: ((IMC?) -> Void) { get set }

    func validateFields(weight: String, height: String)
}

final class IMCViewModel: IMCViewModelProtocol {
    var didFinishValidation: ((IMC?) -> Void) = { _ in }
    private var weight = 0.0
    private var height = 0.0

    func validateFields(weight: String, height: String) {
        if isHeightValid(height) && isWeightValid(weight){
            let imc = IMC(weight: self.weight, height: self.height)
            didFinishValidation(imc)
        } else { didFinishValidation(nil) }
    }

    private func isWeightValid(_ value: String) -> Bool {
        guard let doubleValue = Double(value) else { return false }
        weight = doubleValue

        if doubleValue.isGreater(than: 7) && doubleValue.isLessThanOrEqualTo(595) { return true }
        return false
    }

    private func isHeightValid(_ value: String) -> Bool {
        guard let doubleValue = Double(value) else { return false }
        height = doubleValue

        if doubleValue.isGreater(than: 50) && doubleValue.isLessThanOrEqualTo(3000) { return true }
        return false
    }
}
