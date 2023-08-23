//
//  GenderEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

enum Gender: String, CaseIterable {
    case male = "Laki-laki"
    case female = "Perempuan"
}

extension Gender {
    static func fromString(_ string: String?) -> Gender? {
        return Gender(rawValue: string ?? "")
    }
}
