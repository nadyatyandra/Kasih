//
//  UserExtension.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import Foundation

extension User {
    var genderEnum: GenderEnum? {
        GenderEnum.fromString(religion)
    }

    var religionEnum: ReligionEnum? {
        ReligionEnum.fromString(religion)
    }

    var bloodTypeEnum: BloodTypeEnum? {
        BloodTypeEnum.fromString(baby?.bloodType)
    }

    var vaccineEnum: VaccineEnum? {
        VaccineEnum.fromString(vaksin)
    }

    var asiList: [Asi] {
        asiSet?.allObjects as? [Asi] ?? []
    }

    var lifestyleList: [Lifestyle] {
        lifestyles?.allObjects as? [Lifestyle] ?? []
    }
}

