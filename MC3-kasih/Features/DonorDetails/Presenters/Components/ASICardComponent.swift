//
//  ASICardComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct ASICardComponent: View {
    var asiImg: String
    var quantity: Double
    var pouchSize: Double
    var dateProd: String
    var user: String
    var distance: Double
    var status: String
    
    var body: some View {
        HStack {
            Image(asiImg)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(4)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("\(Int(quantity)) Kantong (\(Int(pouchSize))mL)")
                        .typography(.baseBold())
                    Spacer()
                    Text("\(Int(distance))km")
                        .typography(.small())
                }
                Text("Produksi \(dateProd)")
                    .typography(.small())
                Text(user)
                    .typography(.small())
                    .padding(.top, 2)
//                Text(status)
//                    .typography(.small(color: Colors.white))
//                    .background(Colors.pp400)
//                    .cornerRadius(4)
//                    .padding(.top, 2)
            }
            .padding(8)
        }
        .background(Colors.white)
        .cornerRadius(8)
        .shadow(radius: 16)
        .frame(width: 361, height: 125)
    }
}

struct ASICardComponent_Previews: PreviewProvider {
    static var previews: some View {
        ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0, status: "Kirim Permintaan")
    }
}
