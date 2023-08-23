//
//  GenderEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

enum GenderEnum: String, CaseIterable {
    case male = "Laki-laki"
    case female = "Perempuan"
}

extension GenderEnum {
    static func fromString(_ string: String?) -> GenderEnum? {
        return GenderEnum(rawValue: string ?? "")
    }
}
