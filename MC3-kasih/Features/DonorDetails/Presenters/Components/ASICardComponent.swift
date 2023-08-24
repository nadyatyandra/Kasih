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
    var user: String?
    var distance: Double?
    
    var body: some View {
        HStack {
            Image(asiImg)
                .resizable()
                .scaledToFill()
                .frame(width: 72, height: 72)
                .cornerRadius(4)
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(Int(quantity)) Kantong (\(Int(pouchSize))mL)")
                        .typography(.baseBold)
                    Text("Produksi \(dateProd)")
                        .typography(.small)
                    Spacer()
                    if user == nil {
                        Button {
                            
                        } label: {
                            Text("Kirim Permintaan")
                                .foregroundColor(Colors.white)
                                .typography(.small)
                                .background(Colors.pp400)
                                .cornerRadius(4)
                                .padding(.top, 2)
                        }
                    }
                }
                Spacer()
                if let distance = distance {
                    Text("\(Int(distance))km")
                        .typography(.small)
                }
            }
            .padding(.leading, 16)
        }
        .padding(8)
        .background(Colors.white)
        .cornerRadius(12)
        .shadow(color: Colors.black.opacity(0.15), radius: 5, x: 0, y: 2)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ASICardComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0)
            ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023")
        }
    }
}
