//
//  ProfilCardComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct ProfilCardComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Profil Ibu")
                .typography(.large())
                .padding(.bottom, 2)
            Group {
                Text("Golongan Darah")
                    .typography(.baseBold())
                Text("AB+")
                    .typography(.small())
                    .padding(.horizontal, 8)
                    .background(Colors.white)
                    .border(Colors.ab500)
                    .cornerRadius(16)
            }
            Group {
                Text("Agama")
                    .typography(.baseBold())
                Text("Katolik")
                    .typography(.small())
                    .padding(.horizontal, 8)
                    .background(Colors.white)
                    .border(Colors.ab500)
                    .cornerRadius(16)
            }
            Group {
                Text("Gaya Hidup")
                    .typography(.baseBold())
                HStack {
                    Text("Kacang-kacangan")
                        .typography(.small())
                        .padding(.horizontal, 8)
                        .background(Colors.white)
                        .border(Colors.ab500)
                        .cornerRadius(16)
                    Text("Gluten")
                        .typography(.small())
                        .padding(.horizontal, 8)
                        .background(Colors.white)
                        .border(Colors.ab500)
                        .cornerRadius(16)
                    Text("Seafood")
                        .typography(.small())
                        .padding(.horizontal, 8)
                        .background(Colors.white)
                        .border(Colors.ab500)
                        .cornerRadius(16)
                    Text("Merokok")
                        .typography(.small())
                        .padding(.horizontal, 8)
                        .background(Colors.white)
                        .border(Colors.ab500)
                        .cornerRadius(16)
                }
            }
            Group {
                Text("Obat dan Suplemen")
                    .typography(.baseBold())
                Text("Vitamin C, Paracetamol, ASI Booster")
                    .typography(.small())
                    .padding(.bottom, 2)
            }
            Group {
                Text("Alasan Mendonor")
                    .typography(.baseBold())
                Text("Produksi ASI berlebih dan kulkas penuh")
                    .typography(.small())
                    .padding(.bottom, 2)
            }
        }
        .background(Colors.white)
        .cornerRadius(8)
        .shadow(radius: 16)
    }
}

struct ProfilCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfilCardComponent()
    }
}
