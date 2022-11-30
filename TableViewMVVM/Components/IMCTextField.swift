//
//  IMCTextField.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

class IMCTextField: UITextField {
    private let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)

    override func layoutSubviews() {
        super.layoutSubviews()
        keyboardType = .numberPad
        textColor = .white
        setupLayer()
    }

    private func setupLayer() {
        layer.cornerRadius = 12
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
    }

    func setupPlaceHolder(_ text: String) {
        attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
    }
}

extension IMCTextField {
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
       return bounds.inset(by: padding)
    }
}
