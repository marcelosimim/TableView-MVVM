//
//  HomeViewController.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

class HomeViewController: UIViewController {
    private let homeView:HomeViewProtocol = HomeView()
    private let viewModel:HomeViewModelProtocol = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Jogadores"
        setupTableView()
        viewModel.shuffleCells()
    }

    override func loadView() {
        super.loadView()
        view = homeView.view
    }

    private func setupTableView() {
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCells().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.identifier) as? PlayerTableViewCell else {
            fatalError()
        }
        let model = viewModel.getCells()[indexPath.row]

        cell.configure(model)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didTappedCell(indexPath)
    }

    private func didTappedCell(_ indexPath: IndexPath) {
        let player = viewModel.getCells()[indexPath.row]
        let alertController = UIAlertController(title: "Quem sou eu?", message: "Eu sou o \(player.type.name)!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Top!!!", style: .cancel)

        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
