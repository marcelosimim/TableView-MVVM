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
        setupTableView()
        viewModel.shuffleCells()
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = "Menu"
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
        let model = viewModel.getCells()[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: type(of: model).identifier) else { fatalError() }
        model.configure(cell: cell)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = viewModel.getCells()[indexPath.row]
        let type = type(of: model).identifier
        
        if type == PlayerCell.identifier {
            let player = model as! TableCellConfigurator<PlayerCell, Player>
            didTappedPlayer(player.item)
        }
        else if type == IMCCell.identifier { navigateTo(IMCViewController()) }
        else if type == CarRotationCell.identifier { navigateTo(CarRotationViewController()) }
        else if type == PalindromoCell.identifier { navigateTo(PalindromoViewController()) }
        else if type == NumberCell.identifier { print("numbers") }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    private func didTappedPlayer(_ player: Player) {
        let alertController = UIAlertController(title: "Quem sou eu?", message: "Eu sou o \(player.type.name)!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Top!!!", style: .cancel)

        alertController.addAction(action)
        present(alertController, animated: true)
    }

    private func navigateTo(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
