//
//  PreferensiComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import SwiftUI

struct PreferensiComponent: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = PreferensiViewModel()
    @State private var showReligionPicker = false
    @State private var showBloodTypePicker = false
    @State private var showGenderPicker = false
    @State private var showKeperluanSkriningPicker = false
    
    var body: some View {
        VStack {
            HStack {
                BackButton() { dismiss() }
                Spacer()
            }
            ScrollView {
                VStack(spacing: 24) {
                    Text("Preferensi Donatur")
                        .typography(.large)
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
                        label: "Gaya Hidup Donatur",
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
                    InputFieldWrapper(
                        label: "Keperluan Verifikasi Skrining Kesehatan",
                        inputField: AnyView(
                            StaticTextField(value: viewModel.keperluanString())
                            {
                                showKeperluanSkriningPicker.toggle()
                            }
                        )
                    )
                    .sheet(isPresented: $showKeperluanSkriningPicker){
                        Picker("Keperluan Verifikasi Skrining Kesehatan", selection: $viewModel.keperluanSkrining) {
                            ForEach(KeperluanEnum.toList(), id: \.self) { keperluan in
                                Text(keperluan.rawValue)
                                    .tag(keperluan)
                            }
                        }
                        .appWheelPicker()
                    }
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct PreferensiComponent_Previews: PreviewProvider {
    static var previews: some View {
        PreferensiComponent()
    }
}
