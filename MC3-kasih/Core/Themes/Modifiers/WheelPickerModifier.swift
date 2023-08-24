//
//  AppWheelPickerModifiers.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct AppWheelPickerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .pickerStyle(WheelPickerStyle())
            .labelsHidden()
            .presentationDetents([.fraction(0.25)])
            .padding()
    }
}

extension View {
    func appWheelPicker() -> some View {
        self.modifier(AppWheelPickerModifier())
    }
}
