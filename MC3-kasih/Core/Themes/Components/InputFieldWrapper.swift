//
//  InputField.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct InputFieldWrapper: View {
    let label: String
    let inputField: AnyView

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .typography(.baseBold)
            inputField
        }
    }
}

struct InputField_Previews: PreviewProvider {
    static var previews: some View {
        InputFieldWrapper(
            label: "Nama",
            inputField:
                AnyView(
                    TextField("Enter Text", text: .constant("dsasdsad"))
                        .textFieldStyle(AppTextFieldStyle()))
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
