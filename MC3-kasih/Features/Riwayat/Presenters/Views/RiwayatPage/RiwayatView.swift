//
//  RiwayatView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

//struct RiwayatView: View {
//    var body: some View {
//        VStack {
//            
//            Collapsible(
//                label: {
//                    
////                    Text("Collapsible")
//                    ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023")
//                },
//                content: {
//                    HStack {
//                        Text("Content")
//                        Spacer()
//                    }
////                    .frame(maxWidth: .infinity)
////                    .padding()
////                    .background(Color.secondary)
//                }
//            )
////            .frame(maxWidth: .infinity)
//            
//            Spacer()
//        }
//        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}

struct RiwayatView: View {
    @State private var menu = 0
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Riwayat")
                    .typography(.title)
                Picker("", selection: $menu) {
                    Text("Berlangsung")
                        .tag(0)
                    Text("Selesai")
                        .tag(1)
                }
                .pickerStyle(.segmented)
                .padding(.bottom)
                if (menu == 0) {
                    BerlangsungView()
                }
                else if (menu == 1) {
                    SelesaiView()
                }
            }
            .padding(.horizontal, 16)
            GeometryReader { geometry in
                Rectangle()
                    .foregroundColor(Colors.pp300)
                    .frame(width: .infinity, height: geometry.size.height)
                    .offset(y: geometry.size.height * 0.99)
            }
        }
    }
}

struct RiwayatView_Previews: PreviewProvider {
    static var previews: some View {
        RiwayatView()
    }
}
