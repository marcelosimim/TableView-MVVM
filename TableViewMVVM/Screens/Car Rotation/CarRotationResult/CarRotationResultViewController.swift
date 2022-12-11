//
//  CarRotationResultViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class CarRotationResultViewController: UIViewController {
    private var carRotationResultView: CarRotationResultViewProtocol = CarRotationResultView()
    private var viewmodel: CarRotationResultViewModelProtocol = CarRotationResultViewModel()
    private let licensePlate: String

    init(licensePlate: String) {
        self.licensePlate = licensePlate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rodízio em SP"
        setupView()
    }

    override func loadView() {
        super.loadView()
        view = carRotationResultView.view
    }

    private func setupView() {
        let currentDay = viewmodel.calculateDays()
        carRotationResultView.setupDayLabels(currentDay)

        let restrictionDay = viewmodel.checkRestriction(licensePlate)
        carRotationResultView.setupRestriction(restrictionDay)
    }
}
