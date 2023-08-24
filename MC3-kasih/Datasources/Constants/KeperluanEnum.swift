//
//  KeperluanEnum.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 25/08/23.
//

import Foundation

enum KeperluanEnum: String, CaseIterable {
    case perlu = "Perlu"
    case tidakPerlu = "Tidak Perlu"
    case none = ""
}

extension KeperluanEnum {
    static func fromString(_ string: String?) -> KeperluanEnum? {
        return KeperluanEnum(rawValue: string ?? "")
    }

    static func toList() -> [KeperluanEnum] {
        return [.perlu, .tidakPerlu]
    }
}
