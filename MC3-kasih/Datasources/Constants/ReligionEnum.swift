//
//  ReligionEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

enum Religion: String, CaseIterable {
    case katolik = "Katolik"
    case islam = "Islam"
    case protestan = "Protestan"
    case buddha = "Buddha"
    case hindu = "Hindu"
    case konghucu = "Konghucu"
}

extension Religion {
    static func fromString(_ string: String?) -> Religion? {
        return Religion(rawValue: string ?? "")
    }
}
