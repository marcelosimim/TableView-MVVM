//
//  PlayerType.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import Foundation
import UIKit

enum PlayerType {
    case alexSandro
    case alisson
    case casemiro
    case danilo
    case marquinhos
    case neymar
    case paqueta
    case raphinha
    case richarlisson
    case thiago
    case vinijr

    var image: UIImage {
        switch self {
        case .alexSandro:
            return UIImage.alex
        case .alisson:
            return UIImage.alisson
        case .casemiro:
            return UIImage.casemiro
        case .danilo:
            return UIImage.danilo
        case .marquinhos:
            return UIImage.marquinhos
        case .neymar:
            return UIImage.neymar
        case .paqueta:
            return UIImage.paqueta
        case .raphinha:
            return UIImage.raphinha
        case .richarlisson:
            return UIImage.richarlisson
        case .thiago:
            return UIImage.thiago
        case .vinijr:
            return UIImage.vinijr
        }
    }

    var name: String {
        switch self {
        case .alexSandro:
            return "Alex Sandro"
        case .alisson:
            return "Alisson"
        case .casemiro:
            return "Casemiro"
        case .danilo:
            return "Danilo"
        case .marquinhos:
            return "Marquinhos"
        case .neymar:
            return "Neymar"
        case .paqueta:
            return "Paquetá"
        case .raphinha:
            return "Raphinha"
        case .richarlisson:
            return "Richarlisson"
        case .thiago:
            return "Thiago Silva"
        case .vinijr:
            return "Vini Jr"
        }
    }
}
