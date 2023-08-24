//
//  Progress.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 23/08/23.
//

import SwiftUI

enum ProgressEnum {
    case previous
    case current
    
    var circleColor: Color {
        switch self {
        case .previous: return Colors.ab100
        case .current: return Colors.ab500
        }
    }
    
    var typography: TypographyStyle {
        switch self {
        case .previous: return .base
        case .current: return .baseBold
        }
    }
}

struct ProgressTypography: ViewModifier {
    let progress: ProgressEnum
    
    func body(content: Content) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Circle()
                .fill(progress.circleColor)
                .frame(width: 12)
                .offset(y: 1)
            content
                .typography(progress.typography)
        }
    }
}

extension View {
    func progressStatus(_ progress: ProgressEnum) -> some View {
        self.modifier(ProgressTypography(progress: progress))
    }
}

struct ProgressTypography_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("asdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasd")
                .progressStatus(.previous)
            Text("asd")
                .progressStatus(.current)
        }
    }
}
