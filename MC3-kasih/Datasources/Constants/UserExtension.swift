//
//  UserExtension.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import Foundation

extension User {
    var asiList: [Asi] {
        asiSet?.allObjects as? [Asi] ?? []
    }

    var bloodTypeEnum: BloodType? {
        BloodType.fromString(baby?.bloodType)
    }

    var religionEnum: BloodType? {
        BloodType.fromString(baby?.bloodType)
    }
}

