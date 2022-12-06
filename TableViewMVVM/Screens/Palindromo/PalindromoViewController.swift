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
    private var viewmodel: PalindromoViewModelProtocol = PalindromoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PALINDROMO"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        palindromoView.delegate = self
        binds()
    }

    override func loadView() {
        super.loadView()
        view = palindromoView.view
    }

    private func binds() {
        viewmodel.didFinishValidationSuccess = { [weak self] title in
            self?.showAlert(title)
        }
        viewmodel.didFinishValidationFailure = { [weak self] title in
            self?.showAlert(title)
        }
    }

    private func showAlert(_ title: String) {
        let alertController = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)

        alertController.addAction(action)
        present(alertController, animated: true)
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

    func didTapVerify(_ text: String) {
        viewmodel.verify(text)
    }
}
