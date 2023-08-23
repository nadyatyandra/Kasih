//
//  VerificationFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct VerificationFormView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var showDatePicker = false

    var body: some View {
        VStack(spacing: 24) {
            InputFieldWrapper(
                label: "Tanggal lahir bayi",
                inputField: AnyView(
                    StaticTextField(value: viewModel.dateOfBirth.formattedString())
                    {
                        showDatePicker.toggle()
                    }
                )
            )
            .sheet(isPresented: $showDatePicker){
                DatePickerSheet(isPickerVisible: $showDatePicker, selectedDate: $viewModel.dateOfBirth, isPast: true)
            }
            InputFieldWrapper(
                label: "Gaya Hidup Donatur",
                inputField: AnyView(
                    ChipsWrapper(chips: viewModel.lifeStyle))
            )
        }
    }
}

struct VerificationForm_Previews: PreviewProvider {
    static var previews: some View {
        VerificationFormView(viewModel: SignUpViewModel())
    }
}
