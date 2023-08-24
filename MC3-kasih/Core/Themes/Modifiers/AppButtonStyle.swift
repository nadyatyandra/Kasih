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
    var isMedium: Bool = false

    private var backgroundColor: Color {
        return isSecondary ? Colors.white : (isDisable ? Color(uiColor: .systemGray4) : Colors.pp400)
    }

    private var foregroundColor: Color {
        return isSecondary ? (isDisable ? Color(uiColor: .systemGray4) : Colors.pp400) : Colors.white
    }
    
    func getPadding() -> CGFloat {
        if isMedium {
            return 6.0
        }
        else {
            return 12.0
        }
    }

    func getFontSize() -> TypographyStyle {
        if isMedium {
            return .baseBold
        }
        else {
            return .large
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(foregroundColor, lineWidth: 1)
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(backgroundColor)

            configuration.label
                .foregroundColor(foregroundColor)
                .typography(getFontSize())
                .opacity(configuration.isPressed && !isDisable ? 0.4 : 1)
                .animation(.easeInOut(duration: 0), value: configuration.isPressed)
                .padding(.vertical, getPadding())
                .padding(.horizontal)
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
