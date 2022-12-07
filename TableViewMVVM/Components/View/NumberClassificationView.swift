//
//  NumberClassificationView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import UIKit

class NumberClassificationView: UIView {
    private lazy var iconClassification: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .xMark
        imageView.tintColor = .red
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var classificationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
    }

    private func addViews() {
        addSubview(iconClassification)
        addSubview(classificationLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconClassification.topAnchor.constraint(equalTo: topAnchor),
            iconClassification.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconClassification.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconClassification.heightAnchor.constraint(equalToConstant: 50),

            classificationLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            classificationLabel.leadingAnchor.constraint(equalTo: iconClassification.trailingAnchor, constant: 8),
            classificationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }

    func configure(text: String) {
        classificationLabel.text = text
    }

    func updateIcon(_ checked: Bool) {
        iconClassification.tintColor = checked ? .systemGreen : .red
        iconClassification.image = checked ? .checkmark : .xMark
    }
}
