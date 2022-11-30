//
//  IMCResultView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/30/22.
//

import UIKit

protocol IMCResultViewDelegate: AnyObject {
    func didTapCalculate()
    func didTapClose()
}

protocol IMCResultViewProtocol {
    var delegate: IMCResultViewDelegate? { get set }
    var view: UIView { get }

    func updateView(_ imc: IMC)
}

class IMCResultView: IMCResultViewProtocol {
    weak var delegate: IMCResultViewDelegate?
    var view: UIView = UIView()
    private lazy var imageResult: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var rangeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var newCalculationButton: IMCMainButton = {
        let button = IMCMainButton()
        button.setTitle("NOVO CÁLCULO", for: .normal)
        button.addTarget(self, action: #selector(didTapCalculate), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var closeButton: IMCSecondButton = {
        let button = IMCSecondButton()
        button.setTitle("VOLTAR", for: .normal)
        button.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        view.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        addViews()
    }

    private func addViews() {
        view.addSubview(imageResult)
        view.addSubview(rangeLabel)
        view.addSubview(resultLabel)
        view.addSubview(newCalculationButton)
        view.addSubview(closeButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageResult.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            imageResult.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            imageResult.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageResult.heightAnchor.constraint(equalToConstant: 200),

            rangeLabel.topAnchor.constraint(equalTo: imageResult.bottomAnchor, constant: 32),
            rangeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            rangeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            resultLabel.topAnchor.constraint(equalTo: rangeLabel.bottomAnchor, constant: 16),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            newCalculationButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 64),
            newCalculationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            newCalculationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newCalculationButton.heightAnchor.constraint(equalToConstant: 50),

            closeButton.topAnchor.constraint(equalTo: newCalculationButton.bottomAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @objc private func didTapCalculate() {
        delegate?.didTapCalculate()
    }

    @objc private func didTapClose() {
        delegate?.didTapClose()
    }

    func updateView(_ imc: IMC) {
        guard let range = imc.range, let value = imc.value else { return }
        imageResult.image = range.icon
        rangeLabel.text = range.title
        resultLabel.text = "Seu IMC é de \(String(format: "%.2f", value)) kg/m2"
    }
}
