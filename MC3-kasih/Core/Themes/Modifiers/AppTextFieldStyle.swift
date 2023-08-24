//
//  AppTextFieldStyle.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct AppTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 12)
            .padding(.horizontal)
            .overlay {
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous)
                .stroke(Colors.ab200, lineWidth: 2)
            }
            .foregroundColor(Colors.ab500)
            .disableAutocorrection(true)
    }
}

extension TextFieldStyle where Self == AppTextFieldStyle {
    static var app: AppTextFieldStyle { .init() }
}

struct AppTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextField("Enter Text", text: .constant("xxzaa"))
            .textFieldStyle(.app)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}


