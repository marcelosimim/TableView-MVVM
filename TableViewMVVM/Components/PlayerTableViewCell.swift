//
//  PlayerTableViewCell.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    static var identifier = "\(PlayerTableViewCell.self)"

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var playerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
    }

    private func addViews() {
        addSubview(nameLabel)
        addSubview(playerImage)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: playerImage.leadingAnchor, constant: -8),

            playerImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            playerImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            playerImage.heightAnchor.constraint(equalToConstant: 150),
            playerImage.widthAnchor.constraint(equalToConstant: 150),
        ])
    }

    func configure(_ model: Player) {
        nameLabel.text = model.type.name
        playerImage.image = model.type.image
    }
}
