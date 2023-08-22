//
//  SkriningFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct SkriningFormView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @StateObject var selfiePicker = ImagePickerManager()
    @StateObject var ktpPicker = ImagePickerManager()

    var body: some View {
        VStack(spacing: 24) {
            InputFieldWrapper(
                label: "Foto Muka",
                inputField: AnyView(
                    EditableScreeningImage(imagePicker: selfiePicker)
                )
            )
            InputFieldWrapper(
                label: "Foto KTP",
                inputField: AnyView(
                    EditableScreeningImage(imagePicker: ktpPicker)
                )
            )
        }
        .onChange(of: selfiePicker.imageState) { state in
            if case .success(let uiImage) = state {
                viewModel.selfie = uiImage
            }
        }
        .onChange(of: ktpPicker.imageState) { state in
            if case .success(let uiImage) = state {
                viewModel.ktp = uiImage
            }
        }
    }
}

struct SkriningForm_Previews: PreviewProvider {
    static var previews: some View {
        SkriningFormView(viewModel: SignUpViewModel())
    }
}
