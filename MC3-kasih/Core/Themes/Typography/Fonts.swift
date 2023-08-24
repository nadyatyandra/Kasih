//
//  Fonts.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

enum TypographyStyle {
    case title(color: Color = Colors.ab500)
    case heading1Reg(color: Color = Colors.ab500)
    case heading1(color: Color = Colors.ab500)
    case heading2Reg(color: Color = Colors.ab500)
    case heading2(color: Color = Colors.ab500)
    case largeReg(color: Color = Colors.ab500)
    case large(color: Color = Colors.ab500)
    case baseBold(color: Color = Colors.ab500)
    case base(color: Color = Colors.ab500)
    case smallBold(color: Color = Colors.ab500)
    case small(color: Color = Colors.ab500)
    
    var defaultColor: Color {
        return Colors.ab500

    var defaultFont: String {
        return "Nunito"
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
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .fontWeight(type.weight)
            .foregroundColor(color)
            .font(Font.custom(type.defaultFont, size: type.size))
    }
}

extension View {
    func typography(_ type: TypographyStyle) -> some View {
        switch type {
        case .title(let color), .heading1Reg(let color), .heading1(let color), .heading2Reg(let color), .heading2(let color), .largeReg(let color), .large(let color), .baseBold(let color), .base(let color), .smallBold(let color), .small(let color):
            return self.modifier(BaseTypography(type: type, color: color))
        }
    }
}
