//
//  BiodataBayiForm.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 24/08/23.
//

import SwiftUI

struct BiodataBayiForm: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var showDatePicker = false
    @State private var showWeekPicker = false
    @State private var showWeightPicker = false
    @State private var showGenderPicker = false

    var body: some View {
        VStack(spacing: 24) {
            Text("Biodata Bayi")
                .typography(.large)
                .frame(maxWidth: .infinity, alignment: .leading)

            InputFieldWrapper(
                label: "Tanggal lahir bayi",
                inputField: AnyView(
                    StaticTextField(value: viewModel.babyDOB?.formattedString() ?? "")
                    {
                        showDatePicker.toggle()
                    }
                )
            )
            .sheet(isPresented: $showDatePicker){
                DatePickerSheet(isPickerVisible: $showDatePicker, selectedDate: $viewModel.babyDOB, isPast: true)
            }

            if viewModel.role == .donator {
                InputFieldWrapper(
                    label: "Minggu Kelahiran Bayi",
                    inputField: AnyView(
                        StaticTextField(value: viewModel.babyBirthWeekString() )
                        {
                            showWeekPicker.toggle()
                        }
                    )
                )
                .sheet(isPresented: $showWeekPicker){
                    Picker("Minggu", selection: $viewModel.babyBirthWeek) {
                        ForEach(12..<100) { number in
                            Text("\(number)")
                                .tag(number)
                        }
                    }
                    .appWheelPicker()
                }

                InputFieldWrapper(
                    label: "Berat Badan Bayi",
                    inputField: AnyView(
                        StaticTextField(value: viewModel.babyBirthWeightString())
                        {
                            showWeightPicker.toggle()
                        }
                    )
                )
                .sheet(isPresented: $showWeightPicker){
                    Picker("Berat Badan", selection: $viewModel.babyWeight) {
                        ForEach(0..<Int((10.0 - 0.0) / 0.1) + 1, id: \.self) { index in
                            let value = 0.0 + Double(index) * 0.1
                            Text("\(value, specifier: "%.1f")")
                                .tag(value)
                        }
                    }
                    .appWheelPicker()
                }
            }

            InputFieldWrapper(
                label: "Jenis Kelamin Bayi",
                inputField: AnyView(
                    StaticTextField(value: viewModel.babyGenderString())
                    {
                        showGenderPicker.toggle()
                    }
                )
            )
            .sheet(isPresented: $showGenderPicker){
                Picker("Jenis Kelamin", selection: $viewModel.babyGender) {
                    ForEach(GenderEnum.toList(), id: \.self) { gender in
                        Text(gender.rawValue)
                            .tag(gender)
                    }
                }
                .appWheelPicker()
            }
        }
    }
}

struct BiodataBayiForm_Previews: PreviewProvider {
    static var previews: some View {
        BiodataBayiForm(viewModel: SignUpViewModel())
    }
}
