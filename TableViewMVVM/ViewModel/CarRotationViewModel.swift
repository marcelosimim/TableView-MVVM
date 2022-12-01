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

    func verifyLicensePlate(text: String, isOldLicensePlate: Bool)
}

final class CarRotationViewModel: CarRotationViewModelProtocol {
    var didFinishValidationSuccess: ((String) -> Void) = { _ in }
    var didFinishValidationFailure: (() -> Void) = { }

    func verifyLicensePlate(text: String, isOldLicensePlate: Bool) {
        isOldLicensePlate ? isOldLicensePlateValid(text) : isNewLicensePlateValid(text)
    }

    private func isOldLicensePlateValid(_ text: String) {
        let regex = "[A-Z]{3}[0-9]{4}"
        let licencePlatePred = NSPredicate(format:"SELF MATCHES %@", regex)
        let isValid = licencePlatePred.evaluate(with: text)

        isValid ? didFinishValidationSuccess(text) : didFinishValidationFailure()
    }

    private func isNewLicensePlateValid(_ text: String) {
        let regex = "[A-Z]{3}[0-9]{1}[A-Z]{1}[0-9]{2}"
        let licencePlatePred = NSPredicate(format:"SELF MATCHES %@", regex)
        let isValid = licencePlatePred.evaluate(with: text)
        
        isValid ? didFinishValidationSuccess(text) : didFinishValidationFailure()
    }
}
