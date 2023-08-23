//
//  UserRoleEnum.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

enum UserRoleEnum: String, CaseIterable {
    case donator = "Donatur"
    case recipient = "Resipien"
}

extension UserRoleEnum {
    static func fromString(_ string: String?) -> UserRoleEnum? {
        return UserRoleEnum(rawValue: string ?? "")
    }
}
