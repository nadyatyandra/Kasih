//
//  BloodTypeEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import Foundation

enum BloodTypeEnum: String, CaseIterable {
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
    case none = ""
}

extension BloodTypeEnum {
    static func fromString(_ string: String?) -> BloodTypeEnum? {
        return BloodTypeEnum(rawValue: string ?? "")
    }

    static func toList() -> [BloodTypeEnum] {
        return [.typeA, .typeB, .typeAB, .typeO, .typeAPositive, .typeANegative, .typeBPositive, .typeBNegative, .typeABPositive, .typeABNegative, .typeOPositive, .typeONegative]
    }
}
