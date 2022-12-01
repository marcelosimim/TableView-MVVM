//
//  CarRotationViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/1/22.
//

import UIKit

class CarRotationViewController: UIViewController {
    private let carRotationView: CarRotationViewProtocol = CarRotationView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = carRotationView.view
    }
}
