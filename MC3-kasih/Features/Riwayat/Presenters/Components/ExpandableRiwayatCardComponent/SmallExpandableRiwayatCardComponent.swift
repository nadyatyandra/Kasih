//
//  SmallExpandableRiwayatCardComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 23/08/23.
//

import SwiftUI

struct SmallExpandableRiwayatCardComponent: View {
    var asiImg: String
    var quantity: Double
    var pouchSize: Double
    var dateProd: String
    var user: String
    var status: String?
    
    var body: some View {
        HStack {
            Image(asiImg)
                .resizable()
                .scaledToFill()
                .frame(width: 72, height: 72)
                .cornerRadius(4)
            VStack(alignment: .leading) {
                Text("\(Int(quantity)) Kantong (\(Int(pouchSize))mL)")
                    .typography(.baseBold)
                Text("Produksi \(dateProd)")
                    .typography(.small)
                Spacer()
                HStack {
                    Text(user)
                        .typography(.smallBold)
//                    Text(user)
//                        .typography(.small)
                    Spacer()
                    Text("Selesai")
                        .foregroundColor(Colors.ab500)
                        .typography(.smallBold)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Colors.ab100)
                        .cornerRadius(4)
//                    Text("Dibatalkan")
//                        .foregroundColor(Colors.pp500)
//                        .typography(.smallBold)
//                        .padding(.horizontal, 8)
//                        .padding(.vertical, 2)
//                        .background(Colors.pp200)
//                        .cornerRadius(4)
                }
            }
            .padding(.leading, 4)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct SmallExpandableRiwayatCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        SmallExpandableRiwayatCardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Putri Marino")
    }
}
