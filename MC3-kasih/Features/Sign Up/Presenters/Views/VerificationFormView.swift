//
//  VerificationFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct VerificationFormView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var showReligionPicker = false
    @State private var showBloodTypePicker = false
    @State private var showVaccinePicker = false

    private var isDonator: Bool {
        viewModel.role == .donator
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                BiodataBayiForm(viewModel: viewModel)

                Divider()

                Text(isDonator ? "Biodata Ibu" : "Preferensi Donatur")
                    .typography(.large)
                    .frame(maxWidth: .infinity, alignment: .leading)

                InputFieldWrapper(
                    label: "Agama",
                    inputField: AnyView(
                        StaticTextField(value: viewModel.religionString())
                        {
                            showReligionPicker.toggle()
                        }
                    )
                )
                .sheet(isPresented: $showReligionPicker){
                    Picker("Agama", selection: $viewModel.religion) {
                        ForEach(ReligionEnum.toList(), id: \.self) { religion in
                            Text(religion.rawValue)
                                .tag(religion)
                        }
                    }
                    .appWheelPicker()
                }

                InputFieldWrapper(
                    label: "Golongan Darah",
                    inputField: AnyView(
                        StaticTextField(value: viewModel.bloodTypeString())
                        {
                            showBloodTypePicker.toggle()
                        }
                    )
                )
                .sheet(isPresented: $showBloodTypePicker){
                    Picker("Golongan Darah", selection: $viewModel.bloodType) {
                        ForEach(BloodTypeEnum.toList(), id: \.self) { bloodType in
                            Text(bloodType.rawValue)
                                .tag(bloodType)
                        }
                    }
                    .appWheelPicker()
                }

                InputFieldWrapper(
                    label: "Gaya Hidup \(isDonator ? "" : "Donatur")",
                    inputField: AnyView(
                        HStack {
                            ChipsWrapper(alignment: .leading) {
                                ForEach(viewModel.lifestyleChips.indices, id: \.self) { index in
                                    ChipComponent(value: viewModel.lifestyleChips[index].value, isSelected: viewModel.lifestyleChips[index].isSelected)
                                    {
                                        viewModel.handleChipSelection(chipIndex: index)
                                    }
                                }
                            }
                            Spacer()
                        }
                    )
                )

                if isDonator {
                    InputFieldWrapper(
                        label: "Vaksin COVID",
                        inputField: AnyView(
                            StaticTextField(value: viewModel.vaccineString())
                            {
                                showVaccinePicker.toggle()
                            }
                        )
                    )
                    .sheet(isPresented: $showVaccinePicker){
                        Picker("Vaksin COVID", selection: $viewModel.bloodType) {
                            ForEach(VaccineEnum.toList(), id: \.self) { vaccine in
                                Text(vaccine.rawValue)
                                    .tag(vaccine)
                            }
                        }
                        .appWheelPicker()
                    }

                    InputFieldWrapper(
                        label: "Alasan menjadi Donatur",
                        inputField: AnyView(
                            TextField("Alasan menjadi Donatur", text: $viewModel.donatorReason)
                                .textFieldStyle(.app))
                    )
                } else {
                    InputFieldWrapper(
                        label: "Alasan menjadi Resipien",
                        inputField: AnyView(
                            TextField("Alasan menjadi Resipien", text: $viewModel.recipientReason)
                                .textFieldStyle(.app))
                    )
                }
            }
        }
    }
}

struct VerificationForm_Previews: PreviewProvider {
    static var previews: some View {
        VerificationFormView(viewModel: SignUpViewModel(userRepo: UserRepository()))
    }
}
