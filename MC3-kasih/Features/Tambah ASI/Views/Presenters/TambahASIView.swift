//
//  TambahASIView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import SwiftUI

struct TambahASIView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = TambahASIViewModel()
    @StateObject var asiPicker = ImagePickerManager()
    @State private var showJumlahKantongPicker = false
    @State private var showUkuranKantongPicker = false
    @State private var showBulanProduksiPicker = false
    
    var body: some View {
        VStack {
            HStack {
                BackButton { dismiss() }
                Spacer()
            }
            .padding(.bottom, 4)
            
            HStack {
                Text("Tambah ASI")
                    .typography(.heading2)
                Spacer()
            }
            
            ScrollView {
                VStack(spacing: 24) {
                    InputFieldWrapper(
                        label: "Foto ASI",
                        inputField: AnyView(
                            EditableScreeningImage(imagePicker: asiPicker)
                        )
                    )
                    InputFieldWrapper(
                        label: "Jumlah Kantong",
                        inputField: AnyView(
                            StaticTextField(value: viewModel.jumlahKantongString())
                            {
                                showJumlahKantongPicker.toggle()
                            }
                        )
                    )
                    .sheet(isPresented: $showJumlahKantongPicker){
                        Picker("Jumlah Kantong", selection: $viewModel.jumlahKantong) {
                            ForEach(0 ..< 10) { number in
                                Text("\(number)")
                                    .tag(number)
                            }
                        }
                        .appWheelPicker()
                    }
                    
                    InputFieldWrapper(
                        label: "Ukuran Kantong",
                        inputField: AnyView(
                            StaticTextField(value: viewModel.ukuranKantongString())
                            {
                                showUkuranKantongPicker.toggle()
                            }
                        )
                    )
                    .sheet(isPresented: $showUkuranKantongPicker){
                        Picker("Ukuran Kantong", selection: $viewModel.ukuranKantong) {
                            ForEach(20 ..< 30) { number in
                                Text("\(number)")
                                    .tag(number)
                            }
                        }
                        .appWheelPicker()
                    }
                    
                    InputFieldWrapper(
                        label: "Bulan Produksi",
                        inputField: AnyView(
                            StaticTextField(value: viewModel.bulanProduksi?.formattedString() ?? "")
                            {
                                showBulanProduksiPicker.toggle()
                            }
                        )
                    )
                    .sheet(isPresented: $showBulanProduksiPicker){
                        DatePickerSheet(isPickerVisible: $showBulanProduksiPicker, selectedDate: $viewModel.bulanProduksi)
                    }
                    NavigationLink(destination: KatalogView()) {
                        Text("Selanjutnya")
                    }
                    .disabled(!viewModel.isValidStep)
                    .fixedSize(horizontal: false, vertical: true)
                    .buttonStyle(viewModel.isValidStep ? .appPrimary : .appPrimaryDisable)
                    .padding(.top)
                }
                .onChange(of: asiPicker.imageState) { state in
                    if case .success(let uiImage) = state {
                        viewModel.asi = uiImage
                    }
                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct TambahASIView_Previews: PreviewProvider {
    static var previews: some View {
        TambahASIView()
    }
}
