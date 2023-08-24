//
//  Chip.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

struct Chip: Identifiable {
    let id = UUID()
    let value: String
    var isSelected: Bool
}
