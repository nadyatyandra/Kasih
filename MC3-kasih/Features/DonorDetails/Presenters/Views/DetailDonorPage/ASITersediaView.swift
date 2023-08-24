//
//  ASITersediaView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct ASITersediaView: View {
    @State var showRincianPermintaanSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(0 ..< 5) { item in
                    Button(action: {
                        showRincianPermintaanSheet = true
                        
                    }) {
                        ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0)
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
            .sheet(isPresented: $showRincianPermintaanSheet) {
                RincianPermintaanSheetComponent()
                    .presentationDetents([.medium])
                    .padding()
            }
        }
    }
}

struct ASITersediaView_Previews: PreviewProvider {
    static var previews: some View {
        ASITersediaView()
    }
}
