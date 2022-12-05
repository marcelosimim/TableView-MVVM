//
//  CarRotationViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import Foundation

protocol CarRotationViewModelProtocol {
    var didFinishValidationSuccess: ((String) -> Void) { get set }
    var didFinishValidationFailure: (() -> Void) { get set }

    func verifyLicensePlate(text: String, licensePlate: LicensePlateType)
}

final class CarRotationViewModel: CarRotationViewModelProtocol {
    var didFinishValidationSuccess: ((String) -> Void) = { _ in }
    var didFinishValidationFailure: (() -> Void) = { }

    func verifyLicensePlate(text: String, licensePlate: LicensePlateType) {
        switch licensePlate {
        case .brazilNew, .brazilOld:
            isBrazilianLicensePlateValid(text)
        }
    }

    private func isBrazilianLicensePlateValid(_ text: String) {
        let isValid = text.count == 7
        isValid ? didFinishValidationSuccess(text) : didFinishValidationFailure()
    }
}
