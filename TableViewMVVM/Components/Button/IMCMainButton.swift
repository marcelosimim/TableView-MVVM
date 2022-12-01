//
//  IMCMainButton.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/30/22.
//

import UIKit

class IMCMainButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 12
        backgroundColor = UIColor(red: 108/255, green: 183/255, blue: 151/255, alpha: 1)
    }
}
