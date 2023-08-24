//
//  DetailDonorView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct DetailDonorView: View {
    @State private var menu = 0
    
    var body: some View {
        VStack {
            HStack {
                Image("placeholder")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .mask(Circle())
                VStack(alignment: .leading) {
                    Text("Rachmaniar")
                        .typography(.heading2())
                    Text("Kesehatan Terverifikasi")
                        .typography(.small())
                    Text("3km darimu")
                        .typography(.small())
                    Text("Telah berdonasi kepada 3 bayi")
                        .typography(.small())
                }
            }
            Picker("", selection: $menu) {
                Text("Detail Donatur")
                    .tag(0)
                Text("ASI Tersedia")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.bottom)
            if (menu == 0) {
                DetailDonaturView()
            }
            else if (menu == 1) {
                ScrollView {
                    ASITersediaView()
                }
            }
        }
    }
}

struct DetailDonorView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDonorView()
    }
}
