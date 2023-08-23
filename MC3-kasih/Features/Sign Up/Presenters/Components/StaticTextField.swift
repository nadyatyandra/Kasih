//
//  StaticTextField.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct StaticTextField: View {
    let value: String
    let onTap: () -> ()

    var body: some View {
        Text(value)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous)
                .stroke(Colors.ab200, lineWidth: 2)
            }
            .foregroundColor(Colors.ab500)
            .onTapGesture {
                onTap()
            }
    }
}

struct StaticTextField_Previews: PreviewProvider {
    static var previews: some View {
        StaticTextField(value: "Hhahaahaha"){}
    }
}
