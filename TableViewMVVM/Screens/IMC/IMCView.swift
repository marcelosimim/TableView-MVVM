//
//  IMCView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

protocol IMCViewDelegate: AnyObject {
    func didTapCalculate(weight: String, height: String)
}

protocol IMCViewProtocol {
    var delegate: IMCViewDelegate? { get set }
    var view: UIView { get }
}

class IMCView: IMCViewProtocol {
    weak var delegate: IMCViewDelegate?
    var view: UIView = UIView()

    private lazy var weightTextField: IMCTextField = {
        let textfield = IMCTextField()
        textfield.setupPlaceHolder("Peso (Kg)")
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var heightTextField: IMCTextField = {
        let textfield = IMCTextField()
        textfield.setupPlaceHolder("Altura (cm)")
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var calculateButton: IMCMainButton = {
        let button = IMCMainButton()
        button.setTitle("CALCULAR", for: .normal)
        button.addTarget(self, action: #selector(didTapCalculate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        view.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        addViews()
    }

    private func addViews() {
        view.addSubview(weightTextField)
        view.addSubview(heightTextField)
        view.addSubview(calculateButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            weightTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            weightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            weightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weightTextField.heightAnchor.constraint(equalToConstant: 50),

            heightTextField.topAnchor.constraint(equalTo: weightTextField.bottomAnchor, constant: 32),
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            heightTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            heightTextField.heightAnchor.constraint(equalToConstant: 50),

            calculateButton.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 64),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func didTapCalculate() {
        guard let weight = weightTextField.text, let height = heightTextField.text else { return }
        delegate?.didTapCalculate(weight: weight, height: height)
    }
}
