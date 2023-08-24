//
//  ProfilCardComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct ProfilCardComponent: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Colors.ab500, lineWidth: 1)
            VStack(alignment: .leading) {
                Text("Profil Ibu")
                    .typography(.large)
                    .padding(.bottom, 2)
                VStack(alignment: .leading) {
                    Text("Golongan Darah")
                        .typography(.baseBold)
                    HStack {
                        ChipComponent(value: "AB+", isSelected: false, isDisabled: true)
                        Spacer()
                    }
                    .offset(y: -8)
                }
                VStack(alignment: .leading) {
                    Text("Agama")
                        .typography(.baseBold)
                    HStack {
                        ChipComponent(value: "Katolik", isSelected: false, isDisabled: true)
                        Spacer()
                    }
                    .offset(y: -8)
                }
                VStack(alignment: .leading) {
                    Text("Gaya Hidup")
                        .typography(.baseBold)
                    HStack {
                        ChipsWrapper(alignment: .leading) {
                            ForEach(0 ..< 5) { data in
                                ChipComponent(value: "Kacang-kacangan", isSelected: false, isDisabled: true)
                            }
                        }
                        Spacer()
                    }
                    .offset(y: -8)
                }
                VStack(alignment: .leading) {
                    Text("Obat dan Suplemen")
                        .typography(.baseBold)
                    Text("Vitamin C, Paracetamol, ASI Booster")
                        .typography(.base)
                        .padding(.bottom, 2)
                }
                VStack(alignment: .leading) {
                    Text("Alasan Mendonor")
                        .typography(.baseBold)
                    Text("Produksi ASI berlebih dan kulkas penuh")
                        .typography(.base)
                        .padding(.bottom, 2)
                }
            }
            .padding(16)
        }
        .background(Colors.white)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ProfilCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProfilCardComponent()
        }
    }
}

