//
//  RincianPermintaanSheetComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct RincianPermintaanSheetComponent: View {
    @StateObject var viewModel = RincianPermintaanSheetComponentViewModel()
    @State private var showJumlahProdukPicker = false
    @State private var showTanggalPengambilanPicker = false
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Rincian Permintaan")
                .typography(.large)
                .frame(maxWidth: .infinity, alignment: .leading)

            InputFieldWrapper(
                label: "Jumlah Produk",
                inputField: AnyView(
                    StaticTextField(value: viewModel.jumlahProdukString())
                    {
                        showJumlahProdukPicker.toggle()
                    }
                )
            )
            .sheet(isPresented: $showJumlahProdukPicker){
                Picker("Jumlah Produk", selection: $viewModel.jumlahProduk) {
                    ForEach(0 ..< 10) { number in
                        Text("\(number)")
                            .tag(number)
                    }
                }
                .appWheelPicker()
            }

            InputFieldWrapper(
                label: "Tanggal Pengambilan",
                inputField: AnyView(
                    StaticTextField(value: viewModel.tanggalPengambilan?.formattedString() ?? "")
                    {
                        showTanggalPengambilanPicker.toggle()
                    }
                )
            )
            .sheet(isPresented: $showTanggalPengambilanPicker){
                DatePickerSheet(isPickerVisible: $showTanggalPengambilanPicker, selectedDate: $viewModel.tanggalPengambilan)
            }
            
            Button("Kirim Permintaan") {
                
            }
            .disabled(!viewModel.isValidStep)
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(viewModel.isValidStep ? .appPrimary : .appPrimaryDisable)
            .padding(.top)
        }
    }
}

struct RincianPermintaanSheetComponent_Previews: PreviewProvider {
    static var previews: some View {
        RincianPermintaanSheetComponent()
    }
}
