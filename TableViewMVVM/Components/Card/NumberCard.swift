//
//  NumberCard.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import UIKit

class NumberCard: UIView {
    private lazy var primeNumber: NumberClassificationView = {
        let view = NumberClassificationView()
        view.configure(text: "Número primo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var evenNumber: NumberClassificationView = {
        let view = NumberClassificationView()
        view.configure(text: "Número par")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var oddNumber: NumberClassificationView = {
        let view = NumberClassificationView()
        view.configure(text: "Número ímpar")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var naturalNumber: NumberClassificationView = {
        let view = NumberClassificationView()
        view.configure(text: "Número natural")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayer()
        addViews()
    }

    private func setupLayer() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1).cgColor
    }

    private func addViews() {
        addSubview(primeNumber)
        addSubview(evenNumber)
        addSubview(oddNumber)
        addSubview(naturalNumber)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            primeNumber.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            primeNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            primeNumber.centerXAnchor.constraint(equalTo: centerXAnchor),

            evenNumber.topAnchor.constraint(equalTo: primeNumber.bottomAnchor, constant: 8),
            evenNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            evenNumber.centerXAnchor.constraint(equalTo: centerXAnchor),

            oddNumber.topAnchor.constraint(equalTo: evenNumber.bottomAnchor, constant: 8),
            oddNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            oddNumber.centerXAnchor.constraint(equalTo: centerXAnchor),

            naturalNumber.topAnchor.constraint(equalTo: oddNumber.bottomAnchor, constant: 8),
            naturalNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            naturalNumber.centerXAnchor.constraint(equalTo: centerXAnchor),
            naturalNumber.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

    func updatePrimeCard(_ value: Bool) {
        primeNumber.updateIcon(value)
    }

    func updateEvenCard(_ value: Bool) {
        evenNumber.updateIcon(value)
        oddNumber.updateIcon(!value)
    }

    func updateNaturalCard(_ value: Bool) {
        naturalNumber.updateIcon(value)
    }
}
