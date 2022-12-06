//
//  PalindromoViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/6/22.
//

import UIKit

class PalindromoViewController: UIViewController {
    private var palindromoView: PalindromoViewProtocol = PalindromoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PALINDROMO"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func loadView() {
        super.loadView()
        view = palindromoView.view
    }
}
