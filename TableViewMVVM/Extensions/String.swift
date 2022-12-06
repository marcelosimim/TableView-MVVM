//
//  String.swift
//  TableViewMVVM
//
//  Created by Marcelo Simim Santos on 12/6/22.
//

import Foundation

extension String {
    func removeAccent() -> String {
        self.replacingOccurrences(of: "ã", with: "a")
            .replacingOccurrences(of: "â", with: "a")
            .replacingOccurrences(of: "á", with: "a")
            .replacingOccurrences(of: "à", with: "a")
            .replacingOccurrences(of: "ä", with: "a")
            .replacingOccurrences(of: "ê", with: "e")
            .replacingOccurrences(of: "é", with: "e")
            .replacingOccurrences(of: "è", with: "e")
            .replacingOccurrences(of: "ë", with: "e")
            .replacingOccurrences(of: "î", with: "i")
            .replacingOccurrences(of: "í", with: "i")
            .replacingOccurrences(of: "ì", with: "i")
            .replacingOccurrences(of: "ï", with: "i")
            .replacingOccurrences(of: "õ", with: "o")
            .replacingOccurrences(of: "ô", with: "o")
            .replacingOccurrences(of: "ó", with: "o")
            .replacingOccurrences(of: "ò", with: "o")
            .replacingOccurrences(of: "ö", with: "o")
            .replacingOccurrences(of: "û", with: "u")
            .replacingOccurrences(of: "ú", with: "u")
            .replacingOccurrences(of: "ù", with: "u")
            .replacingOccurrences(of: "ü", with: "u")
    }

    func removePunctuation() -> String {
        self.replacingOccurrences(of: "!", with: "")
            .replacingOccurrences(of: "?", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ",", with: "")
            .replacingOccurrences(of: ":", with: "")
            .replacingOccurrences(of: "-", with: "")
    }

    func removeSpacing() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
}
