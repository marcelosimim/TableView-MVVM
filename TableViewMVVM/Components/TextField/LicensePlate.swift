//
//  OldLicensePlateTextField.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class LicensePlate: UIView {
    private lazy var licensePlateImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var textfields: [UITextField] = [firstTextField, secondTextField, thirdTextField, fourthTextField, fifthTextField, sixthTextField, seventhTextField]
    private lazy var firstTextField = RoundedTextField()
    private lazy var secondTextField = RoundedTextField()
    private lazy var thirdTextField = RoundedTextField()
    private lazy var fourthTextField = RoundedTextField()
    private lazy var fifthTextField = RoundedTextField()
    private lazy var sixthTextField = RoundedTextField()
    private lazy var seventhTextField = RoundedTextField()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupRoundedTextFields(textfields)
        addViews()
    }

    private func setupRoundedTextFields(_ textFields: [UITextField]) {
        var tag = 0
        for textfield in textfields {
            textfield.delegate = self
            textfield.tag = tag
            tag += 1
        }
    }

    private func clean() {
        for textfield in textfields {
            textfield.text = ""
        }
    }

    private func addViews() {
        addSubview(licensePlateImage)
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
        let leading: CGFloat = 8
        NSLayoutConstraint.activate([
            licensePlateImage.topAnchor.constraint(equalTo: topAnchor),
            licensePlateImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            licensePlateImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            licensePlateImage.heightAnchor.constraint(equalToConstant: 100),

            firstTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            secondTextField.leadingAnchor.constraint(equalTo: firstTextField.trailingAnchor, constant: leading),
            thirdTextField.leadingAnchor.constraint(equalTo: secondTextField.trailingAnchor, constant: leading),
            fourthTextField.leadingAnchor.constraint(equalTo: thirdTextField.trailingAnchor, constant: leading),
            fifthTextField.leadingAnchor.constraint(equalTo: fourthTextField.trailingAnchor, constant: leading),
            sixthTextField.leadingAnchor.constraint(equalTo: fifthTextField.trailingAnchor, constant: leading),
            seventhTextField.leadingAnchor.constraint(equalTo: sixthTextField.trailingAnchor, constant: leading),
            seventhTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        setupTextFieldConstraints()
    }

    private func setupTextFieldConstraints() {
        let width: CGFloat = 35
        let height: CGFloat = 45
        for textfield in textfields {
            textfield.topAnchor.constraint(equalTo: licensePlateImage.bottomAnchor, constant: 32).isActive = true
            textfield.widthAnchor.constraint(equalToConstant: width).isActive = true
            textfield.heightAnchor.constraint(equalToConstant: height).isActive = true
            textfield.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            textfield.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func setupType(_ type: LicensePlateType) {
        switch type {
        case .brazilNew:
            setupBrazilianNew()
        case .brazilOld:
            setupBrazilianOld()
        }
        clean()
    }

    func getText() -> String {
        guard let firstLetter = firstTextField.text, let secondLetter = secondTextField.text, let thirdLetter = thirdTextField.text, let firstNumber = fourthTextField.text, let secondNumber = fifthTextField.text, let thirdNumber = sixthTextField.text, let fourthNumber = seventhTextField.text else { return "" }

        return "\(firstLetter)\(secondLetter)\(thirdLetter)\(firstNumber)\(secondNumber)\(thirdNumber)\(fourthNumber)"
    }
}

// MARK: - Setup type

extension LicensePlate {
    private func setupBrazilianNew() {
        firstTextField.keyboardType = .default
        secondTextField.keyboardType = .default
        thirdTextField.keyboardType = .default
        fourthTextField.keyboardType = .numberPad
        fifthTextField.keyboardType = .default
        sixthTextField.keyboardType = .numberPad
        seventhTextField.keyboardType = .numberPad
        licensePlateImage.image = .newLicensePlate
    }

    private func setupBrazilianOld() {
        firstTextField.keyboardType = .default
        secondTextField.keyboardType = .default
        thirdTextField.keyboardType = .default
        fourthTextField.keyboardType = .numberPad
        fifthTextField.keyboardType = .numberPad
        sixthTextField.keyboardType = .numberPad
        seventhTextField.keyboardType = .numberPad
        licensePlateImage.image = .oldLicensePlate
    }
}

// MARK: - Delegate

extension LicensePlate: UITextFieldDelegate {
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
