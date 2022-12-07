//
//  OldLicensePlateTextField.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class LicensePlateTextField: UITextField {
    private lazy var textfields: [UITextField] = [firstTextField, secondTextField, thirdTextField, fourthTextField, fifthTextField, sixthTextField, seventhTextField]
    private lazy var firstTextField = RoundedTextField()
    private lazy var secondTextField = RoundedTextField()
    private lazy var thirdTextField = RoundedTextField()
    private lazy var fourthTextField = RoundedTextField()
    private lazy var fifthTextField = RoundedTextField()
    private lazy var sixthTextField = RoundedTextField()
    private lazy var seventhTextField = RoundedTextField()

    private var type: LicensePlateType?

    override func layoutSubviews() {
        super.layoutSubviews()
        setupRoundedTextFields(textfields)
        addViews()
    }

    private func setupRoundedTextFields(_ textFields: [UITextField]) {
        var tag = 0
        for textfield in textfields {
            textfield.delegate = self
            textfield.translatesAutoresizingMaskIntoConstraints = false
            textfield.tag = tag
            tag += 1
        }
    }

    private func addViews() {
        addSubview(firstTextField)
        addSubview(secondTextField)
        addSubview(thirdTextField)
        addSubview(fourthTextField)
        addSubview(fifthTextField)
        addSubview(sixthTextField)
        addSubview(seventhTextField)
        setupConstraints()
    }

    private func setupConstraints() {
        let textfieldHeight: CGFloat = 30
        let leading: CGFloat = 8
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: topAnchor),
            firstTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            firstTextField.widthAnchor.constraint(equalToConstant: textfieldHeight),

            secondTextField.topAnchor.constraint(equalTo: topAnchor),
            secondTextField.leadingAnchor.constraint(equalTo: firstTextField.trailingAnchor, constant: leading),
            secondTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            secondTextField.widthAnchor.constraint(equalToConstant: textfieldHeight),

            thirdTextField.topAnchor.constraint(equalTo: topAnchor),
            thirdTextField.leadingAnchor.constraint(equalTo: secondTextField.trailingAnchor, constant: leading),
            thirdTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            thirdTextField.widthAnchor.constraint(equalToConstant: textfieldHeight),

            fourthTextField.topAnchor.constraint(equalTo: topAnchor),
            fourthTextField.leadingAnchor.constraint(equalTo: thirdTextField.trailingAnchor, constant: leading),
            fourthTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            fourthTextField.widthAnchor.constraint(equalToConstant: textfieldHeight),

            fifthTextField.topAnchor.constraint(equalTo: topAnchor),
            fifthTextField.leadingAnchor.constraint(equalTo: fourthTextField.trailingAnchor, constant: leading),
            fifthTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            fifthTextField.widthAnchor.constraint(equalToConstant: textfieldHeight),

            sixthTextField.topAnchor.constraint(equalTo: topAnchor),
            sixthTextField.leadingAnchor.constraint(equalTo: fifthTextField.trailingAnchor, constant: leading),
            sixthTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            sixthTextField.widthAnchor.constraint(equalToConstant: textfieldHeight),

            seventhTextField.topAnchor.constraint(equalTo: topAnchor),
            seventhTextField.leadingAnchor.constraint(equalTo: sixthTextField.trailingAnchor, constant: leading),
            seventhTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            seventhTextField.widthAnchor.constraint(equalToConstant: textfieldHeight),
            seventhTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    func setupType(_ type: LicensePlateType) {
        self.type = type

        switch type {
        case .brazilNew:
            setupBrazilianNew()
        case .brazilOld:
            setupBrazilianOld()
        }
    }

    func getText() -> String {
        guard let firstLetter = firstTextField.text, let secondLetter = secondTextField.text, let thirdLetter = thirdTextField.text, let firstNumber = fourthTextField.text, let secondNumber = fifthTextField.text, let thirdNumber = sixthTextField.text, let fourthNumber = seventhTextField.text else { return "" }

        return "\(firstLetter)\(secondLetter)\(thirdLetter)\(firstNumber)\(secondNumber)\(thirdNumber)\(fourthNumber)"
    }

    func clean() {
        for textfield in textfields {
            textfield.text = ""
        }
    }
}

// MARK: - Setup type

extension LicensePlateTextField {
    private func setupBrazilianNew() {
        firstTextField.keyboardType = .default
        secondTextField.keyboardType = .default
        thirdTextField.keyboardType = .default
        fourthTextField.keyboardType = .numberPad
        fifthTextField.keyboardType = .default
        sixthTextField.keyboardType = .numberPad
        seventhTextField.keyboardType = .numberPad
    }

    private func setupBrazilianOld() {
        firstTextField.keyboardType = .default
        secondTextField.keyboardType = .default
        thirdTextField.keyboardType = .default
        fourthTextField.keyboardType = .numberPad
        fifthTextField.keyboardType = .numberPad
        sixthTextField.keyboardType = .numberPad
        seventhTextField.keyboardType = .numberPad
    }
}

// MARK: - Delegate

extension LicensePlateTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if isDefaultKeyboardType(textField) && !string.isALetter() { return false }
        else if isNumberPadKeyboardType(textField) && !string.isANumber() { return false }

        guard let textFieldText = textField.text, let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count

        if count <= 1 {
            textField.text = string
            goToNextTextField(textField)
            return true
        } else { return false }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        goToNextTextField(textField)
        return false
    }

    private func isDefaultKeyboardType(_ textField: UITextField) -> Bool {
      textField.keyboardType.rawValue == 0
    }

    private func isNumberPadKeyboardType(_ textField: UITextField) -> Bool {
        textField.keyboardType.rawValue == 4
    }

    private func goToNextTextField(_ textField: UITextField) {
        let nextTag: NSInteger = textField.tag + 1
        guard let nextResponder: UIResponder = textField.superview?.viewWithTag(nextTag) else {
            textField.resignFirstResponder()
            return
        }
        nextResponder.becomeFirstResponder()
    }
}
