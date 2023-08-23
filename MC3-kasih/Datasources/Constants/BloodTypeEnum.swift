//
//  BloodTypeEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import Foundation

enum BloodType: String, CaseIterable {
    case typeA = "A"
    case typeB = "B"
    case typeAB = "AB"
    case typeO = "O"
    case typeAPositive = "A+"
    case typeANegative = "A-"
    case typeBPositive = "B+"
    case typeBNegative = "B-"
    case typeABPositive = "AB+"
    case typeABNegative = "AB-"
    case typeOPositive = "O+"
    case typeONegative = "O-"
}

extension BloodType {
    static func fromString(_ string: String?) -> BloodType? {
        return BloodType(rawValue: string ?? "")
    }
}
