//
//  NumbersViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import RxSwift
import RxCocoa
import UIKit

class NumbersViewController: UIViewController {
    private var numbersView: NumbersViewProtocol = NumbersView()
    private var viewmodel: NumbersViewModelProtocol = NumbersViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Números"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        numbersView.inputTextField.delegate = self
        textFieldBinds()
        viewModelBinds()
    }

    override func loadView() {
        super.loadView()
        view = numbersView.view
    }

    private func textFieldBinds() {
        numbersView.inputTextField.rx.controlEvent(.editingChanged).bind {
            guard let textFieldText = self.numbersView.inputTextField.text else { return }
            self.viewmodel.verifyNumber(textFieldText)
        }.disposed(by: disposeBag)

    }

    private func viewModelBinds() {
        viewmodel.primeValue.bind { value in
            self.numbersView.numbersCard.updatePrimeCard(value)
        }.disposed(by: disposeBag)

        viewmodel.evenValue.bind { value in
            self.numbersView.numbersCard.updateEvenCard(value)
        }.disposed(by: disposeBag)

        viewmodel.naturalValue.bind { value in
            self.numbersView.numbersCard.updateNaturalCard(value)
        }.disposed(by: disposeBag)
    }
}

extension NumbersViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text else { return false }
        if isBackspace(string) { return true }
        if !isAValidChar(string) { return false }
        if string == "-" && !canTypeMinus(textFieldText) { return false }
        return true
    }

    private func isAValidChar(_ string: String) -> Bool {
        string.isANumber() || string == "-"
    }

    private func canTypeMinus(_ textFieldText: String) -> Bool {
        textFieldText.count == 0
    }

    private func isBackspace(_ string: String) -> Bool {
        string.isEmpty
    }
}
