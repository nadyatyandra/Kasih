//
//  DatePickerSheet.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct DatePickerSheet: View {
    @Binding var isPickerVisible: Bool
    @Binding var selectedDate: Date
    var isPast: Bool = false

    var body: some View {
        Group {
            if isPast {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    in: ...Date(),
                    displayedComponents: .date
                )
            } else {
                DatePicker(
                    "",
                    selection: $selectedDate,
                    in: Date()...,
                    displayedComponents: .date
                )
            }
        }
        .datePickerStyle(WheelDatePickerStyle())
        .labelsHidden()
        .presentationDetents([.fraction(0.25)])
        .padding()
    }
}

struct DatePickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerSheet(isPickerVisible: .constant(true), selectedDate: .constant(Date()))
    }
}
