//
//  HomeViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import Foundation

protocol HomeViewModelProtocol {
    func getCells() -> [Player]
    func shuffleCells()
}

final class HomeViewModel: HomeViewModelProtocol {
    private var players: [Player] = [ Player(type: .neymar), Player(type: .vinijr), Player(type: .richarlisson), Player(type: .raphinha), Player(type: .paqueta), Player(type: .casemiro), Player(type: .thiago), Player(type: .marquinhos), Player(type: .danilo), Player(type: .alexSandro), Player(type: .alisson) ]


    func getCells() -> [Player] {
        players
    }

    func shuffleCells() {
        players = players.shuffled()
    }
}
