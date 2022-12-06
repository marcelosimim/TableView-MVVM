//
//  PalindromoView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/6/22.
//

import UIKit

protocol PalindromoViewProtocol {
    var view: UIView { get }
}

class PalindromoView: PalindromoViewProtocol {
    var view = UIView()

    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "Não sabe o que é palíndromo?"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Clique aqui e saiba mais!", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.contentHorizontalAlignment = .leading
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var textFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "Informe a frase"
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var inputField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var verifyButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.setTitle("Verificar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        view.backgroundColor = .white
        addViews()
    }

    private func addViews() {
        view.addSubview(infoLabel)
        view.addSubview(infoButton)
        view.addSubview(textFieldLabel)
        view.addSubview(inputField)
        view.addSubview(verifyButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            infoButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 4),
            infoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            textFieldLabel.topAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: 16),
            textFieldLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            inputField.topAnchor.constraint(equalTo: textFieldLabel.bottomAnchor, constant: 4),
            inputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            inputField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            verifyButton.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: 16),
            verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            verifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verifyButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
