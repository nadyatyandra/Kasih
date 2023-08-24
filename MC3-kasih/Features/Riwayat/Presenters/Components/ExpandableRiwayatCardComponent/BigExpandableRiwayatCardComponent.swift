//
//  BigExpandableRiwayatCardComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import SwiftUI

func asd() {
    
}

struct BigExpandableRiwayatCardComponent: View {
    var asiImg: String
    var quantity: Double
    var pouchSize: Double
    var dateProd: String
    var user: String
    var status: String?
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Permintaan Masuk, 3 Agustus 2023")
                .progressStatus(.previous)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Button(action: {}) {
                    HStack {
                        Image("iconWhatsApp")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 25, height: 25)
                        Text("Hubungi melalui WhatsApp")
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .buttonStyle(AppButtonStyle(isMedium: true))
                
                Button("Selesai") {}
                    .fixedSize(horizontal: false, vertical: true)
                    .buttonStyle(AppButtonStyle(isMedium: true))
                Button("Lapor") {}
                    .fixedSize(horizontal: false, vertical: true)
                    .buttonStyle(AppButtonStyle(isSecondary: true, isMedium: true))
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
        }
    }
}

struct BigExpandableRiwayatCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        BigExpandableRiwayatCardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Putri Marino")
    }
}
