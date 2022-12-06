//
//  CarRotationView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

protocol CarRotationViewDelegate: AnyObject {
    func didTapVerify(text: String, licensePlate: LicensePlateType)
}

protocol CarRotationViewProtocol {
    var view: UIView { get }
    var delegate: CarRotationViewDelegate? { get set }
    var licensePlate: LicensePlateTextField { get }
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

    lazy var licensePlate: LicensePlateTextField = {
        let view = LicensePlateTextField()
        view.setupType(.brazilOld)
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
        view.addSubview(licensePlate)
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

            licensePlate.topAnchor.constraint(equalTo: licensePlateImage.bottomAnchor, constant: 32),
            licensePlate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            licensePlate.heightAnchor.constraint(equalToConstant: 50),

            verifyButton.topAnchor.constraint(equalTo: licensePlate.bottomAnchor, constant: 50),
            verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 128),
            verifyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verifyButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }

    @objc private func didTapTypeControl(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        defineImage(selectedIndex)
        defineTextFieldType(selectedIndex)
        licensePlate.clean()
    }

    private func defineImage(_ index: Int) {
        licensePlateImage.image = index == 0 ? .oldLicensePlate : .newLicensePlate
    }

    private func defineTextFieldType(_ index: Int) {
        index == 0 ? licensePlate.setupType(.brazilOld) : licensePlate.setupType(.brazilNew)
    }

    @objc private func didTapVerify() {
        let selectedIndex = typeControl.selectedSegmentIndex
        selectedIndex == 0 ? delegate?.didTapVerify(text: licensePlate.getText(), licensePlate: .brazilOld) : delegate?.didTapVerify(text: licensePlate.getText(), licensePlate: .brazilNew)
    }
}
