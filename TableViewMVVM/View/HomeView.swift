//
//  HomeView.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

protocol HomeViewProtocol {
    var view: UIView { get }
    var tableView: UITableView { get }
}

class HomeView: HomeViewProtocol {
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(PlayerCell.self, forCellReuseIdentifier: PlayerCell.identifier)
        tableview.register(IMCCell.self, forCellReuseIdentifier: IMCCell.identifier)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()

    var view: UIView = UIView()

    init() {
        view.backgroundColor = .white
        addViews()
    }

    private func addViews() {
        view.addSubview(tableView)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
