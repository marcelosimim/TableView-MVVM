//
//  CarRotationView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

protocol CarRotationViewDelegate: AnyObject {
    func didTapVerify(text: String, isOldLicensePlate: Bool)
}

protocol CarRotationViewProtocol {
    var view: UIView { get }
    var delegate: CarRotationViewDelegate? { get set }
    var licensePlateOld: OldLicensePlateTextField { get }
    var licensePlateNew: NewLicensePlateTextField { get }
}

class CarRotationView: CarRotationViewProtocol {
    var view = UIView()
    weak var delegate: CarRotationViewDelegate?

    private lazy var typeControl: UISegmentedControl = {
        let items = ["Placa antiga", "Placa nova"]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.translatesAutoresizingMaskIntoConstraints = false
         control.addTarget(self, action: #selector(didTapTypeControl(_:)), for: .valueChanged)
        return control
    }()

    private lazy var licensePlateImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .oldLicensePlate
        imageView.layer.cornerRadius = 12
        return imageView
    }()

    lazy var licensePlateOld: OldLicensePlateTextField = {
        let view = OldLicensePlateTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var licensePlateNew: NewLicensePlateTextField = {
        let view = NewLicensePlateTextField()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var verifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("VERIFICAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapVerify), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        view.backgroundColor = .white
        addViews()
    }

    private func addViews() {
        view.addSubview(typeControl)
        view.addSubview(licensePlateImage)
        view.addSubview(licensePlateOld)
        view.addSubview(licensePlateNew)
        view.addSubview(verifyButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            typeControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            typeControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            typeControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            licensePlateImage.topAnchor.constraint(equalTo: typeControl.bottomAnchor, constant: 32),
            licensePlateImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            licensePlateImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            licensePlateOld.topAnchor.constraint(equalTo: licensePlateImage.bottomAnchor, constant: 32),
            licensePlateOld.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            licensePlateOld.heightAnchor.constraint(equalToConstant: 50),

            licensePlateNew.topAnchor.constraint(equalTo: licensePlateImage.bottomAnchor, constant: 32),
            licensePlateNew.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            licensePlateNew.heightAnchor.constraint(equalToConstant: 50),

            verifyButton.topAnchor.constraint(equalTo: licensePlateOld.bottomAnchor, constant: 50),
            verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 128),
            verifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verifyButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    @objc private func didTapTypeControl(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        defineImage(selectedIndex)
    }

    private func defineImage(_ index: Int) {
        licensePlateImage.image = index == 0 ? .oldLicensePlate : .newLicensePlate
        licensePlateOld.isHidden = index == 0 ? false : true
        licensePlateNew.isHidden = !licensePlateOld.isHidden
    }

    @objc private func didTapVerify() {
        let isOldLicensePlate = !licensePlateOld.isHidden

        if isOldLicensePlate {
            delegate?.didTapVerify(text: licensePlateOld.getText(), isOldLicensePlate: true)
        } else {
            delegate?.didTapVerify(text: licensePlateNew.getText(), isOldLicensePlate: false)
        }
    }
}
