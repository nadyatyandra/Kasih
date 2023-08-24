//
//  Fonts.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

enum TypographyStyle {
    case title
    case heading1Reg
    case heading1
    case heading2Reg
    case heading2
    case largeReg
    case large
    case baseBold
    case base
    case smallBold
    case small

    var defaultFont: String {
        return "Nunito"
    }

    var defaultColor: Color {
        return Colors.ab500
    }

    var size: CGFloat {
        switch self {
        case .title: return 39
        case .heading1, .heading1Reg: return 31
        case .heading2, .heading2Reg: return 25
        case .large, .largeReg: return 20
        case .base, .baseBold: return 16
        case .small, .smallBold: return 13
        }
    }

    var weight: Font.Weight {
        switch self {
        case .title, .heading2, .baseBold, .smallBold: return .bold
        case .heading1, .large: return .semibold
        case .heading1Reg, .heading2Reg, .largeReg, .base, .small: return .regular
        }
    }
}

struct BaseTypography: ViewModifier {
    let type: TypographyStyle

    func body(content: Content) -> some View {
        content
            .fontWeight(type.weight)
            .foregroundColor(type.defaultColor)
            .font(Font.custom(type.defaultFont, size: type.size))
    }
}

extension View {
    func typography(_ type: TypographyStyle) -> some View {
        self.modifier(BaseTypography(type: type))
    }
}
