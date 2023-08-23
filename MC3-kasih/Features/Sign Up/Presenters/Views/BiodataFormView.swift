//
//  BiodataFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct BiodataFormView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        VStack(spacing: 24) {
            InputFieldWrapper(
                label: "Nama",
                inputField: AnyView(
                    TextField("Nama", text: $viewModel.name)
                        .textFieldStyle(.app))
            )
            InputFieldWrapper(
                label: "Nomor Telepon",
                inputField: AnyView(
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(.app))
            )
            InputFieldWrapper(
                label: "Nomor Telepon",
                inputField: AnyView(
                    TextField("Nomor Telepon", text: $viewModel.phoneNumber)
                        .keyboardType(.numberPad)
                        .textFieldStyle(.app))
            )
            InputFieldWrapper(
                label: "Lokasi",
                inputField: AnyView(
                    TextField("Lokasi", text: $viewModel.city)
                        .textFieldStyle(.app))
            )
        }
    }
}

struct BiodataForm_Previews: PreviewProvider {
    static var previews: some View {
        BiodataFormView(viewModel: SignUpViewModel())
    }
}
