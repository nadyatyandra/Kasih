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
        ScrollView {
            VStack(spacing: 24) {
                InputFieldWrapper(
                    label: "Foto KTP",
                    inputField: AnyView(
                        EditableScreeningImage(imagePicker: ktpPicker)
                    )
                )
                InputFieldWrapper(
                    label: "Swafoto dengan KTP",
                    inputField: AnyView(
                        EditableScreeningImage(imagePicker: selfiePicker)
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
}

struct SkriningForm_Previews: PreviewProvider {
    static var previews: some View {
        SkriningFormView(viewModel: SignUpViewModel(userRepo: UserRepository()))
    }
}
