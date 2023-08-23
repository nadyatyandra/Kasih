//
//  VaccineEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

import Foundation

enum Vaccine: String, CaseIterable {
    case vaksin1 = "Vaksin 1"
    case vaksin2 = "Vaksin 2"
    case vaksin3 = "Vaksin 3"
    case booster1 = "Booster 1"
    case booster2 = "Booster 2"
    case booster3 = "Booster 3"
}

extension Vaccine {
    static func fromString(_ string: String?) -> Vaccine? {
        return Vaccine(rawValue: string ?? "")
    }
}
