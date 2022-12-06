//
//  IMCViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

class IMCViewController: UIViewController {
    private var imcView: IMCViewProtocol = IMCView()
    private var viewmodel: IMCViewModelProtocol = IMCViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        imcView.delegate = self
        binds()
    }

    override func loadView() {
        super.loadView()
        view = imcView.view
    }

    private func setupView() {
        title = "Calculadora IMC"
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }

    private func binds() {
        viewmodel.didFinishValidation = { [weak self] imc in
            self?.goToResultView(imc)
        }
        viewmodel.didFinishValidationFailure = { [weak self] errorMessage in
            self?.showError(errorMessage)
        }
    }

    private func goToResultView(_ imc: IMC) {
        let resultVC = IMCResultViewController(imc: imc)
        navigationController?.pushViewController(resultVC, animated: true)
    }

    private func showError(_ message: String) {
        let alertController = UIAlertController(title: "Dados inválidos", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)

        alertController.addAction(action)
        present(alertController, animated: true)
    }
}

extension IMCViewController: IMCViewDelegate {
    func didTapCalculate(weight: String, height: String) {
        viewmodel.validateFields(weight: weight, height: height)
    }
}
