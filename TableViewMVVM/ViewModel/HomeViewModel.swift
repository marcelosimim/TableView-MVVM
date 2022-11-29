//
//  HomeViewModel.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import Foundation

protocol HomeViewModelProtocol {
    func getCells() -> [CellConfigurator]
    func shuffleCells()
}

final class HomeViewModel: HomeViewModelProtocol {
    typealias PlayerCellConfigurator = TableCellConfigurator<PlayerCell, Player>
    typealias IMCCellConfigurator = TableCellConfigurator<IMCCell, IMC>
    private var cells: [CellConfigurator] = [ PlayerCellConfigurator(item: Player(type: .neymar)),
                                              PlayerCellConfigurator(item: Player(type: .vinijr)),
                                              PlayerCellConfigurator(item: Player(type: .richarlisson)),
                                              PlayerCellConfigurator(item: Player(type: .raphinha)),
                                              PlayerCellConfigurator(item: Player(type: .paqueta)),
                                              PlayerCellConfigurator(item: Player(type: .casemiro)),
                                              PlayerCellConfigurator(item: Player(type: .thiago)),
                                              PlayerCellConfigurator(item: Player(type: .marquinhos)),
                                              PlayerCellConfigurator(item: Player(type: .danilo)),
                                              PlayerCellConfigurator(item: Player(type: .alexSandro)),
                                              PlayerCellConfigurator(item: Player(type: .alisson)),
                                              IMCCellConfigurator(item: IMC(title: "Calculadora de IMC")) ]
}

extension HomeViewModel {
    func getCells() -> [CellConfigurator] {
        cells
    }

    func shuffleCells() {
        cells = cells.shuffled()
    }
}
