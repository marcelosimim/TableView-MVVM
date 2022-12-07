//
//  NumbersRevealView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import Foundation
import UIKit

protocol NumbersRevealViewProtocol {
    var view: UIView { get }

    func updateLabel(_ text: String)
}

class NumbersRevealView: NumbersRevealViewProtocol {
    var view = UIView()

    private lazy var randomPhraseLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        view.backgroundColor = .white
        addViews()
    }

    private func addViews() {
        view.addSubview(randomPhraseLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            randomPhraseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomPhraseLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            randomPhraseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }

    func updateLabel(_ text: String) {
        randomPhraseLabel.text = text
    }
}
