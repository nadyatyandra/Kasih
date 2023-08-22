//
//  AppButtonStyle.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    var isSecondary: Bool = false
    var isDisable: Bool = false

    private var backgroundColor: Color {
        return isSecondary ? Colors.white : (isDisable ? .gray : Colors.pp400)
    }

    private var foregroundColor: Color {
        return isSecondary ? (isDisable ? .gray : Colors.pp400) : Colors.white
    }

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(foregroundColor, lineWidth: 1)
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(backgroundColor)

            configuration.label
                .foregroundColor(foregroundColor)
                .typography(.large)
                .opacity(configuration.isPressed ? 0.4 : 1)
                .animation(.easeInOut(duration: 0), value: configuration.isPressed)
                .padding()
        }
    }
}

extension ButtonStyle where Self == AppButtonStyle {
    static var appPrimary: AppButtonStyle { .init() }
    static var appPrimaryDisable: AppButtonStyle { .init(isDisable: true) }
    static var appSecondary: AppButtonStyle { .init(isSecondary: true) }
    static var appSecondaryDisable: AppButtonStyle { .init(isSecondary: true, isDisable: true) }
}

struct AppButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("Primary") {}
                .buttonStyle(.appPrimary)
            Button("Primary Disable") {}
                .buttonStyle(.appPrimaryDisable)
            Button("Secondary") {}
                .buttonStyle(.appSecondary)
            Button("Secondary Disable") {}
                .buttonStyle(.appSecondaryDisable)
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
