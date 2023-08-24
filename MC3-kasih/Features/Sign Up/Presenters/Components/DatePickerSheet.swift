//
//  DatePickerSheet.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct DatePickerSheet: View {
    @Binding var isPickerVisible: Bool
    @Binding var selectedDate: Date?
    var isPast: Bool = false

    var body: some View {
        let nonOptionalDateBinding = Binding<Date>(
            get: { selectedDate ?? Date() },
            set: { selectedDate = $0 }
        )

        return Group {
            if isPast {
                DatePicker(
                    "",
                    selection: nonOptionalDateBinding,
                    in: ...Date(),
                    displayedComponents: .date
                )
            } else {
                DatePicker(
                    "",
                    selection: nonOptionalDateBinding,
                    in: Date()...,
                    displayedComponents: .date
                )
            }
        }
        .datePickerStyle(WheelDatePickerStyle())
        .labelsHidden()
        .presentationDetents([.fraction(0.3)])
        .padding()
    }
}

struct DatePickerSheet_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerSheet(isPickerVisible: .constant(true), selectedDate: .constant(Date()))
    }
}
