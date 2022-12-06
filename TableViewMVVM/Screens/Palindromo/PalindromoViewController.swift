//
//  PalindromoViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/6/22.
//

import SafariServices
import UIKit

class PalindromoViewController: UIViewController {
    private var palindromoView: PalindromoViewProtocol = PalindromoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PALINDROMO"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        palindromoView.delegate = self
    }

    override func loadView() {
        super.loadView()
        view = palindromoView.view
    }
}

extension PalindromoViewController: PalindromoViewDelegate {
    func didTapLearnMore() {
        guard let url = URL(string: "https://www.dicio.com.br/lista-palindromos/") else { return }
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true

        let safariVC = SFSafariViewController(url: url, configuration: config)
        present(safariVC, animated: true)
    }
}
