//
//  StaticTextField.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct StaticTextField: View {
    let value: String
    let onTap: () -> Void

    var body: some View {
        HStack {
            Text(value)
            Spacer()
            Image(systemName: "chevron.down")
        }
        .foregroundColor(Colors.ab500)
        .typography(.base)
        .padding(.vertical, 12)
        .padding(.horizontal)
        .overlay {
            RoundedRectangle(
                cornerRadius: 12,
                style: .continuous)
            .stroke(Colors.ab200, lineWidth: 2)
        }
        .onTapGesture(perform: onTap)
    }
}

struct StaticTextField_Previews: PreviewProvider {
    static var previews: some View {
        StaticTextField(value: "Hhahaahaha"){}
    }
}
