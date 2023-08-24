//
//  ReligionEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

enum ReligionEnum: String, CaseIterable {
    case katolik = "Katolik"
    case islam = "Islam"
    case protestan = "Protestan"
    case buddha = "Buddha"
    case hindu = "Hindu"
    case konghucu = "Konghucu"
    case none = ""
}

extension ReligionEnum {
    static func fromString(_ string: String?) -> ReligionEnum? {
        return ReligionEnum(rawValue: string ?? "")
    }

    static func toList() -> [ReligionEnum] {
        return [.katolik, .islam, .protestan, .buddha, .hindu, .konghucu]
    }
}
