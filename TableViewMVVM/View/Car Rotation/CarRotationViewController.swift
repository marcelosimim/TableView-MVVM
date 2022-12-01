//
//  CarRotationViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class CarRotationViewController: UIViewController {
    private var carRotationView: CarRotationViewProtocol = CarRotationView()
    private var viewmodel: CarRotationViewModelProtocol = CarRotationViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        carRotationView.delegate = self
        setupTextFields()
        binds()
    }

    override func loadView() {
        super.loadView()
        view = carRotationView.view
    }

    private func setupTextFields() {
        carRotationView.licensePlateOld.textfields.forEach { [unowned self] textfield in
            textfield.delegate = self
        }
        carRotationView.licensePlateNew.textfields.forEach { [unowned self] textfield in
            textfield.delegate = self
        }
    }

    private func binds() {
        viewmodel.didFinishValidationSuccess = { [weak self] in
            self?.navigateToResult()
        }
        viewmodel.didFinishValidationFailure = { [weak self] in
            self?.showError()
        }
    }

    private func navigateToResult() {
        // navigationController?.pushViewController(vc, animated: true)
    }

    private func showError() {
        let alertController = UIAlertController(title: "Dados inválidos", message: "Digite uma placa válida", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)

        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

extension CarRotationViewController: CarRotationViewDelegate {
    func didTapVerify(text: String, isOldLicensePlate: Bool) {
        viewmodel.verifyLicensePlate(text: text, isOldLicensePlate: isOldLicensePlate)
    }
}

extension CarRotationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text, let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 1
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
