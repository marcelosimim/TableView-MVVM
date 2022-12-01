//
//  OldLicensePlateTextField.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class OldLicensePlateTextField: UITextField {
    lazy var textfields: [UITextField] = [firstLetter, secondLetter, thirdLetter, firstNumber, secondNumber, thirdNumber, fourthNumber]

    private lazy var firstLetter: RoundedTextField = {
        let textfield = RoundedTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var secondLetter: RoundedTextField = {
        let textfield = RoundedTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var thirdLetter: RoundedTextField = {
        let textfield = RoundedTextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var firstNumber: RoundedTextField = {
        let textfield = RoundedTextField()
        textfield.keyboardType = .numberPad
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var secondNumber: RoundedTextField = {
        let textfield = RoundedTextField()
        textfield.keyboardType = .numberPad
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var thirdNumber: RoundedTextField = {
        let textfield = RoundedTextField()
        textfield.keyboardType = .numberPad
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

    private lazy var fourthNumber: RoundedTextField = {
        let textfield = RoundedTextField()
        textfield.keyboardType = .numberPad
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()

     lazy var lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
    }

    private func addViews() {
        addSubview(firstLetter)
        addSubview(secondLetter)
        addSubview(thirdLetter)
        addSubview(lineSeparator)
        addSubview(firstNumber)
        addSubview(secondNumber)
        addSubview(thirdNumber)
        addSubview(fourthNumber)
        setupConstraints()
    }

    private func setupConstraints() {
        let textfieldHeight: CGFloat = 30
        NSLayoutConstraint.activate([
            firstLetter.topAnchor.constraint(equalTo: topAnchor),
            firstLetter.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstLetter.bottomAnchor.constraint(equalTo: bottomAnchor),
            firstLetter.widthAnchor.constraint(equalToConstant: textfieldHeight),

            secondLetter.topAnchor.constraint(equalTo: topAnchor),
            secondLetter.leadingAnchor.constraint(equalTo: firstLetter.trailingAnchor, constant: 8),
            secondLetter.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondLetter.widthAnchor.constraint(equalToConstant: textfieldHeight),

            thirdLetter.topAnchor.constraint(equalTo: topAnchor),
            thirdLetter.leadingAnchor.constraint(equalTo: secondLetter.trailingAnchor, constant: 8),
            thirdLetter.bottomAnchor.constraint(equalTo: bottomAnchor),
            thirdLetter.widthAnchor.constraint(equalToConstant: textfieldHeight),

            lineSeparator.leadingAnchor.constraint(equalTo: thirdLetter.trailingAnchor, constant: 4),
            lineSeparator.centerYAnchor.constraint(equalTo: centerYAnchor),
            lineSeparator.widthAnchor.constraint(equalToConstant: 10),
            lineSeparator.heightAnchor.constraint(equalToConstant: 2),

            firstNumber.topAnchor.constraint(equalTo: topAnchor),
            firstNumber.leadingAnchor.constraint(equalTo: lineSeparator.trailingAnchor, constant: 4),
            firstNumber.bottomAnchor.constraint(equalTo: bottomAnchor),
            firstNumber.widthAnchor.constraint(equalToConstant: textfieldHeight),

            secondNumber.topAnchor.constraint(equalTo: topAnchor),
            secondNumber.leadingAnchor.constraint(equalTo: firstNumber.trailingAnchor, constant: 8),
            secondNumber.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondNumber.widthAnchor.constraint(equalToConstant: textfieldHeight),

            thirdNumber.topAnchor.constraint(equalTo: topAnchor),
            thirdNumber.leadingAnchor.constraint(equalTo: secondNumber.trailingAnchor, constant: 8),
            thirdNumber.bottomAnchor.constraint(equalTo: bottomAnchor),
            thirdNumber.widthAnchor.constraint(equalToConstant: textfieldHeight),

            fourthNumber.topAnchor.constraint(equalTo: topAnchor),
            fourthNumber.leadingAnchor.constraint(equalTo: thirdNumber.trailingAnchor, constant: 8),
            fourthNumber.bottomAnchor.constraint(equalTo: bottomAnchor),
            fourthNumber.widthAnchor.constraint(equalToConstant: textfieldHeight),
            fourthNumber.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    func getText() -> String {
        guard let firstLetter = firstLetter.text, let secondLetter = secondLetter.text, let thirdLetter = thirdLetter.text, let firstNumber = firstNumber.text, let secondNumber = secondNumber.text, let thirdNumber = thirdNumber.text, let fourthNumber = fourthNumber.text else { return "" }

        return "\(firstLetter)\(secondLetter)\(thirdLetter)\(firstNumber)\(secondNumber)\(thirdNumber)\(fourthNumber)"
    }
}
