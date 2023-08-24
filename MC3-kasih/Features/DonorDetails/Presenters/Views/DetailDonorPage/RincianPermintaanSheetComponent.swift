//
//  RincianPermintaanSheetComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct RincianPermintaanSheetComponent: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel = RincianPermintaanSheetComponentViewModel()
    @State private var showJumlahProdukPicker = false
    @State private var showTanggalPengambilanPicker = false
    @State private var showWaktuPengambilanPicker = false
    
    var body: some View {
        VStack(spacing: 24) {
            HStack {
                BackButton(){ dismiss() }
                Spacer()
            }
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
                    StaticTextField(value: viewModel.tanggalPengambilan.formattedString())
                    {
                        showTanggalPengambilanPicker.toggle()
                    }
                )
            )
            .sheet(isPresented: $showTanggalPengambilanPicker){
                DatePicker("", selection: $viewModel.tanggalPengambilan, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .presentationDetents([.fraction(0.3)])
                    .padding()
            }
            
            InputFieldWrapper(
                label: "Waktu Pengambilan",
                inputField: AnyView(
                    StaticTextField(value: viewModel.formatTime(from: viewModel.waktuPengambilan) ?? "")
                    {
                        showWaktuPengambilanPicker.toggle()
                    }
                )
            )
            .sheet(isPresented: $showWaktuPengambilanPicker){
                DatePicker("", selection: $viewModel.waktuPengambilan, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .presentationDetents([.fraction(0.3)])
                    .padding()
            }
            Spacer()
            NavigationLink(destination: RiwayatView()) {
                Text("Kirim Permintaan")
            }
            .disabled(!viewModel.isValidStep)
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(viewModel.isValidStep ? .appPrimary : .appPrimaryDisable)
            .padding(.top)
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .padding()
    }
}

struct RincianPermintaanSheetComponent_Previews: PreviewProvider {
    static var previews: some View {
        RincianPermintaanSheetComponent()
    }
}
