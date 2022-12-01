//
//  NewLicensePlateTextField.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class NewLicensePlateTextField: UITextField {
    lazy var textfields: [UITextField] = [firstLetter, secondLetter, thirdLetter, firstNumber, secondNumber, thirdNumber, fourthLetter]

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

    private lazy var fourthLetter: RoundedTextField = {
        let textfield = RoundedTextField()
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


    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
    }

    private func addViews() {
        addSubview(firstLetter)
        addSubview(secondLetter)
        addSubview(thirdLetter)
        addSubview(firstNumber)
        addSubview(fourthLetter)
        addSubview(secondNumber)
        addSubview(thirdNumber)
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

            firstNumber.topAnchor.constraint(equalTo: topAnchor),
            firstNumber.leadingAnchor.constraint(equalTo: thirdLetter.trailingAnchor, constant: 8),
            firstNumber.bottomAnchor.constraint(equalTo: bottomAnchor),
            firstNumber.widthAnchor.constraint(equalToConstant: textfieldHeight),

            fourthLetter.topAnchor.constraint(equalTo: topAnchor),
            fourthLetter.leadingAnchor.constraint(equalTo: firstNumber.trailingAnchor, constant: 8),
            fourthLetter.bottomAnchor.constraint(equalTo: bottomAnchor),
            fourthLetter.widthAnchor.constraint(equalToConstant: textfieldHeight),

            secondNumber.topAnchor.constraint(equalTo: topAnchor),
            secondNumber.leadingAnchor.constraint(equalTo: fourthLetter.trailingAnchor, constant: 8),
            secondNumber.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondNumber.widthAnchor.constraint(equalToConstant: textfieldHeight),

            thirdNumber.topAnchor.constraint(equalTo: topAnchor),
            thirdNumber.leadingAnchor.constraint(equalTo: secondNumber.trailingAnchor, constant: 8),
            thirdNumber.bottomAnchor.constraint(equalTo: bottomAnchor),
            thirdNumber.widthAnchor.constraint(equalToConstant: textfieldHeight),
            thirdNumber.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    func getText() -> String {
        guard let firstLetter = firstLetter.text, let secondLetter = secondLetter.text, let thirdLetter = thirdLetter.text, let firstNumber = firstNumber.text, let fourthLetter = fourthLetter.text, let secondNumber = secondNumber.text, let thirdNumber = thirdNumber.text else { return ""}

        return "\(firstLetter)\(secondLetter)\(thirdLetter)\(firstNumber)\(fourthLetter)\(secondNumber)\(thirdNumber)"
    }
}
