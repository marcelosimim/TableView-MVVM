//
//  NumbersViewModel.swift
//  TableViewMVVM
//
//  Created by Marcel o Simim Santos on 12/7/22.
//

// import RxSwift
import RxRelay
import Foundation

protocol NumbersViewModelProtocol {
    var primeValue: PublishRelay<Bool> { get }
    var evenValue: PublishRelay<Bool> { get }
    var naturalValue: PublishRelay<Bool> { get }
    
    func verifyNumber(_ string: String)
}

final class NumbersViewModel: NumbersViewModelProtocol {
    var primeValue: PublishRelay<Bool> = PublishRelay()
    var evenValue: PublishRelay<Bool> = PublishRelay()
    var naturalValue: PublishRelay<Bool> = PublishRelay()

    func verifyNumber(_ string: String) {
        guard let number = Int(string) else { return }
        isAPrimeNumber(number)
        isAEvenNumber(number)
        isNaturalNumber(number)
    }

    private func isAPrimeNumber(_ number: Int) {
        if number == 2 || number == 3 {
            primeValue.accept(true)
        } else if number < 4 {
            primeValue.accept(false)
        } else {
            var dividers = 0
            for i in 2...number/2 {
                if number % i == 0 { dividers += 1 }
            }

            primeValue.accept(dividers == 0)
        }
    }

    private func isAEvenNumber(_ number: Int) {
        evenValue.accept(number % 2 == 0)
    }


    private func isNaturalNumber(_ number: Int) {
        naturalValue.accept(number >= 0)
    }
}
