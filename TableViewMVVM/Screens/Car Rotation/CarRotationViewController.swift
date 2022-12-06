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
        binds()
    }

    override func loadView() {
        super.loadView()
        view = carRotationView.view
    }

    private func binds() {
        viewmodel.didFinishValidationSuccess = { [weak self] licensePlate in
            self?.navigateToResult(licensePlate)
        }
        viewmodel.didFinishValidationFailure = { [weak self] in
            self?.showError()
        }
    }

    private func navigateToResult(_ licensePlate: String) {
        let resultVC = CarRotationResultViewController(licensePlate: licensePlate)
         navigationController?.pushViewController(resultVC, animated: true)
    }

    private func showError() {
        let alertController = UIAlertController(title: "Dados inválidos", message: "Digite uma placa válida", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)

        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

extension CarRotationViewController: CarRotationViewDelegate {
    func didTapVerify(text: String, licensePlate: LicensePlateType) {
        viewmodel.verifyLicensePlate(text: text, licensePlate: licensePlate)
    }
}
