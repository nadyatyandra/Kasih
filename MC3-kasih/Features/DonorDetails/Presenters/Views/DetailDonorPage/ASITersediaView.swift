//
//  ASITersediaView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct ASITersediaView: View {
    @State var rincianPermintaanSheet: Bool = false
    
    var body: some View {
        VStack {
            Button {
                rincianPermintaanSheet = true
            } label: {
                Text("placeholder button")
            }
            
            ForEach(0 ..< 15) { item in
                ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0, status: "Kirim Permintaan")
            }
        }
        .sheet(isPresented: $rincianPermintaanSheet) {
            RincianPermintaanSheetComponent()
        }
    }
}

struct ASITersediaView_Previews: PreviewProvider {
    static var previews: some View {
        ASITersediaView()
    }
}
