//
//  AppButtonStyle.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

extension ButtonStyle where Self == AppButtonStyle {
    static var app: AppButtonStyle { .init() }
}

struct AppButtonStyle: ButtonStyle {
    let radius: CGFloat = 8
    let color: Color = Colors.pp400

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(color)
            configuration.label
                .foregroundColor(Colors.white)
                .typography(.large)
                .opacity(configuration.isPressed ? 0.4 : 1)
                .animation(.easeInOut(duration: 0), value: configuration.isPressed)
                .padding()
        }
    }
}

struct AppButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Selanjutnya"){}
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(.app)
            .previewLayout(.sizeThatFits)
    }
}

