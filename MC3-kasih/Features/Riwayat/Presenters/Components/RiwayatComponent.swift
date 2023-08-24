//
//  RiwayatComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import SwiftUI

struct RiwayatComponent: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Colors.ab500, lineWidth: 1)
            Collapsible(
                label: {
                    AnyView(
                        SmallExpandableRiwayatCardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Putri Marino")
                    )
                }(),
                content: {
                    AnyView(
                        BigExpandableRiwayatCardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Putri Marino")
                    )
                }()
            )
            .padding(8)
        }
        .background(Colors.white)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct RiwayatComponent_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatComponent()
    }
}
