//
//  RincianPermintaanSheetComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct RincianPermintaanSheetComponent: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Rincian Permintaan")
                .typography(.large)
            Group {
                Text("Jumlah Produk")
                    .typography(.baseBold)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Colors.white)
                    .border(Colors.ab500)
                    .frame(width: 324, height: 25)
                    .cornerRadius(12)
            }
            Group {
                Text("Tanggal Pengambilan")
                    .typography(.baseBold)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Colors.white)
                    .border(Colors.ab500)
                    .frame(width: 324, height: 25)
                    .cornerRadius(12)
            }
            Group {
                Text("Waktu Pengambilan")
                    .typography(.baseBold)
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Colors.white)
                    .border(Colors.ab500)
                    .frame(width: 324, height: 25)
                    .cornerRadius(12)
            }
            Button("Kirim Permintaan") {}
                .fixedSize(horizontal: false, vertical: true)
                .buttonStyle(.appPrimary)
        }
        .padding()
    }
}

struct RincianPermintaanSheetComponent_Previews: PreviewProvider {
    static var previews: some View {
        RincianPermintaanSheetComponent()
    }
}
