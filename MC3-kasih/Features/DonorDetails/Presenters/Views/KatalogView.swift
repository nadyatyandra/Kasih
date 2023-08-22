//
//  KatalogView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct KatalogView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Kasih")
                    .typography(.title())
                Spacer()
                Text("icon")
            }
            
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Colors.white)
                .border(Colors.ab500)
                .frame(width: 324, height: 25)
                .cornerRadius(12)
            
            HStack {
                Text("Donatur ASI")
                    .typography(.heading2())
                Spacer()
                Button {
                    
                } label: {
                    Text("Preferensi")
                        .foregroundColor(Colors.white)
                        .padding(.horizontal, 8)
                        .background(Colors.ab500)
                        .typography(.small())
                        .cornerRadius(8)
                        
                }
            }
            
            ForEach(0 ..< 15) { item in
                ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0, status: "Kirim Permintaan")
            }
        }
    }
}

struct KatalogView_Previews: PreviewProvider {
    static var previews: some View {
        KatalogView()
    }
}
