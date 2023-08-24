//
//  ASITersediaView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct ASITersediaView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0 ..< 5) { item in
                    NavigationLink(destination: RincianPermintaanSheetComponent()) {
                        ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023")
                    }
                }
                NavigationLink(destination: TambahASIView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
                            .foregroundColor(Colors.ab500)
                        Text("Tambah ASI")
                            .typography(.baseBold)
                            .padding(32)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }
}

struct ASITersediaView_Previews: PreviewProvider {
    static var previews: some View {
        ASITersediaView()
    }
}
