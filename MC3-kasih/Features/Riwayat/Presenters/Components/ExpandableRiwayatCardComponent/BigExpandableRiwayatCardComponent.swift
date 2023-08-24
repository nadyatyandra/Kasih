//
//  BigExpandableRiwayatCardComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import SwiftUI

struct BigExpandableRiwayatCardComponent: View {
    var asiImg: String
    var quantity: Double
    var pouchSize: Double
    var dateProd: String
    var user: String
    var status: String?
    
    var body: some View {
            Text("Permintaan Masuk, 3 Agustus 2023")
                .progressStatus(.previous)
                .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BigExpandableRiwayatCardComponent_Previews: PreviewProvider {
    static var previews: some View {
        BigExpandableRiwayatCardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Putri Marino")
    }
}
