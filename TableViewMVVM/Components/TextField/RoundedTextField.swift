//
//  RoundedTextField.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class RoundedTextField: UITextField {
    private let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

    override func layoutSubviews() {
        super.layoutSubviews()
        textColor = .black
        textAlignment = .center
        setupLayer()
    }

    private func setupLayer() {
        layer.cornerRadius = 12
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
}

extension RoundedTextField {
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
