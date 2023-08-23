//
//  KatalogView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct KatalogView: View {
    var body: some View {
        ZStack {
            Colors.ab100
                .ignoresSafeArea()
            VStack {
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 32)
                        .foregroundColor(Colors.white)
                        .frame(width: .infinity, height: geometry.size.height)
                        .offset(y: geometry.size.height * 0.14)
                }
            }
            VStack {
                HStack {
                    Text("Kasih")
                        .typography(.title())
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 40.0))
                            .foregroundColor(Colors.ab500)
                    }
                }
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(Colors.white)
                    .border(Colors.ab500)
                    .frame(width: .infinity, height: 25)
                    .cornerRadius(12)
                HStack {
                    Text("Donatur ASI")
                        .typography(.heading2())
                    Spacer()
                    Button {
                        
                    } label: {
                        HStack {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .foregroundColor(Colors.white)
                                .font(.system(size: 15.0))
                            Text("Preferensi")
                                .foregroundColor(Colors.white)
                                .typography(.small())
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Colors.ab500)
                        .cornerRadius(18)
                    }
                }
                ScrollView {
                    ForEach(0 ..< 15) { item in
                        ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0)
                    }
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

struct KatalogView_Previews: PreviewProvider {
    static var previews: some View {
        KatalogView()
    }
}
