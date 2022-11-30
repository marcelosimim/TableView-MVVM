//
//  UIImage.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 11/29/22.
//

import UIKit

extension UIImage {
    static func generateImage(_ name: String) -> UIImage {
        UIImage(named: name) ?? .remove
    }

    // MARK: -  players
    static var alex: UIImage { generateImage("alex") }
    static var alisson: UIImage { generateImage("alisson") }
    static var casemiro: UIImage { generateImage("casemiro") }
    static var danilo: UIImage { generateImage("danilo") }
    static var marquinhos: UIImage { generateImage("marquinhos") }
    static var neymar: UIImage { generateImage("neymar") }
    static var raphinha: UIImage { generateImage("raphinha") }
    static var richarlisson: UIImage { generateImage("richarlisson") }
    static var paqueta: UIImage { generateImage("paqueta") }
    static var thiago: UIImage { generateImage("thiago") }
    static var vinijr: UIImage { generateImage("vinijr") }

    // MARK: - IMC
    static var underweight: UIImage { generateImage("underweight") }
    static var normal: UIImage { generateImage("normal") }
    static var overweight: UIImage { generateImage("overweight") }
    static var obesity1: UIImage { generateImage("obesity1") }
    static var obesity2: UIImage { generateImage("obesity2") }
    static var obesity3: UIImage { generateImage("obesity3") }
}
