//
//  IMCTableViewCell.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

class IMCCell: UITableViewCell, ConfigurableCell {
    typealias DataType = IMCScreen
    static var identifier = "\(IMCCell.self)"

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
    }

    private func addViews() {
        addSubview(titleLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }

    func configure(_ model: IMCScreen) {
        titleLabel.text = model.title
    }
}
