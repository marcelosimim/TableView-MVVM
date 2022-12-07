//
//  NumbersView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import Foundation
import UIKit

protocol NumbersViewDelegate: AnyObject {
    func didTapReveal()
}

protocol NumbersViewProtocol {
    var delegate: NumbersViewDelegate? { get set }
    var view: UIView { get }
    var inputTextField: UITextField { get set }
    var numbersCard: NumberCard { get }
}

class NumbersView: NumbersViewProtocol {
    var delegate: NumbersViewDelegate?
    var view = UIView()

    private lazy var whichValueLabel: UILabel = {
        let label = UILabel()
        label.text = "Qual o valor?"
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var inputTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.clearButtonMode = .always
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    lazy var numbersCard: NumberCard = {
        let card = NumberCard()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()

    private lazy var revealButton: UIButton = {
        let button = UIButton()
        button.setTitle("REVELAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 39/255, green: 36/255, blue: 113/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
        button.addTarget(self, action: #selector(didTapReveal), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        view.backgroundColor = UIColor(red: 253/255, green: 253/255, blue: 253/255, alpha: 1)
        addViews()
    }

    private func addViews() {
        view.addSubview(whichValueLabel)
        view.addSubview(inputTextField)
        view.addSubview(numbersCard)
        view.addSubview(revealButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            whichValueLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            whichValueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            whichValueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            inputTextField.topAnchor.constraint(equalTo: whichValueLabel.bottomAnchor, constant: 8),
            inputTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            inputTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTextField.heightAnchor.constraint(equalToConstant: 44),

            numbersCard.topAnchor.constraint(equalTo: inputTextField.bottomAnchor, constant: 8),
            numbersCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numbersCard.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            revealButton.topAnchor.constraint(equalTo: numbersCard.bottomAnchor, constant: 16),
            revealButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            revealButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            revealButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    @objc private func didTapReveal() {
        delegate?.didTapReveal()
    }
}
