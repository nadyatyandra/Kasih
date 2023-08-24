//
//  CityEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

enum CityEnum: String, CaseIterable {
    case jakarta = "Jakarta"
    case bogor = "Bogor"
    case depok = "Depok"
    case tangerang = "Tangerang"
    case bekasi = "Bekasi"
}

extension CityEnum {
    static func fromString(_ string: String?) -> CityEnum? {
        return CityEnum(rawValue: string ?? "")
    }
}
