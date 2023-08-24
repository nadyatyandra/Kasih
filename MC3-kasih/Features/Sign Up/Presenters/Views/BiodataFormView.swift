//
//  BiodataFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct BiodataFormView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var showCityPicker = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                InputFieldWrapper(
                    label: "Nama",
                    inputField: AnyView(
                        TextField("Nama", text: $viewModel.name)
                            .textFieldStyle(.app))
                )
                InputFieldWrapper(
                    label: "Email",
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
                    label: "Kota",
                    inputField: AnyView(
                        StaticTextField(value: viewModel.cityString())
                        {
                            showCityPicker.toggle()
                        }
                    )
                )
                .sheet(isPresented: $showCityPicker){
                    Picker("Kota", selection: $viewModel.city) {
                        ForEach(CityEnum.toList(), id: \.self) { city in
                            Text(city.rawValue)
                                .tag(city)
                        }
                    }
                    .appWheelPicker()
                }
            }
        }
    }
    
}

struct BiodataForm_Previews: PreviewProvider {
    static var previews: some View {
        BiodataFormView(viewModel: SignUpViewModel(userRepo: UserRepository()))
    }
}
