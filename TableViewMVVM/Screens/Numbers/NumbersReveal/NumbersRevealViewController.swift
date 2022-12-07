//
//  NumbersRevealViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/7/22.
//

import UIKit

class NumbersRevealViewController: UIViewController {
    private let number: Double?
    private let numbersRevealView: NumbersRevealViewProtocol = NumbersRevealView()
    private let viewmodel: NumbersRevealViewModelProtocol = NumbersRevealViewModel()

    init(number: Double?) {
        self.number = number
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        numbersRevealView.updateLabel(viewmodel.choosePhrase(number))
    }

    override func loadView() {
        super.loadView()
        view = numbersRevealView.view
    }

}
