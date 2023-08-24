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
            VStack {
                Button {
                    showRincianPermintaanSheet = true
                } label: {
                    Text("placeholder button")
                }
                ForEach(0 ..< 15) { item in
                    ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0)
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
