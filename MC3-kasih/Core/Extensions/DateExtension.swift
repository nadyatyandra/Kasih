//
//  DateExtension.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import Foundation

extension DateFormatter {
    static let customFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter
    }()
}

extension Date {
    func formattedString() -> String {
        return DateFormatter.customFormatter.string(from: self)
    }
}
