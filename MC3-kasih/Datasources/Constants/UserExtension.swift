//
//  UserExtension.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import Foundation

extension User {
    var asiList: [Asi] {
        return  asiSet?.allObjects as? [Asi] ?? []
    }
}
