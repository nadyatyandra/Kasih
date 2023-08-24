//
//  DetailDonorView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct DetailDonorView: View {
    @State private var menu = 0
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Colors.ab100
                .ignoresSafeArea()
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 32)
                    .foregroundColor(Colors.white)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: geometry.size.height * 0.21)
            }
            VStack {
                HStack {
                    BackButton { dismiss() }
                    Spacer()
                }
                HStack {
                    Image("placeholder")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .mask(Circle())
                    VStack(alignment: .leading) {
                        Text("Rachmaniar")
                            .typography(.heading2)
                        Text("Kesehatan Terverifikasi")
                            .typography(.small)
                        Text("3km darimu")
                            .typography(.small)
                        Text("Telah berdonasi kepada 3 bayi")
                            .typography(.small)
                    }
                    .padding()
                }
                Picker("", selection: $menu) {
                    Text("ASI Tersedia")
                        .tag(0)
                    Text("Detail Donatur")
                        .tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                if (menu == 0) {
                    ASITersediaView()
                }
                else if (menu == 1) {
                    DetailDonaturView()
                }
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct DetailDonorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDonorView()
    }
}
