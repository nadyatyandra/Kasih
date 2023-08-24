//
//  KatalogView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct KatalogView: View {
    @State private var city: CityEnum = .jakarta
    @State private var showLocationPicker = false

    var body: some View {
        ZStack {
            Colors.ab100
                .ignoresSafeArea()
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 32)
                    .foregroundColor(Colors.white)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: geometry.size.height * 0.22)
            }
            VStack {
                HStack {
                    Text("Kasih")
                        .typography(.title)
                    Spacer()
                    NavigationLink(destination: SelectUserRoleView()) {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 40))
                            .foregroundColor(Colors.ab500)
                    }
                }
                ZStack {
                    RoundedRectangle(
                        cornerRadius: 12,
                        style: .continuous)
                    .fill(Colors.white)
                    RoundedRectangle(
                        cornerRadius: 12,
                        style: .continuous)
                    .stroke(Colors.ab200, lineWidth: 2)
                    HStack {
                        HStack {
                            Image(systemName: "location.fill")
                            Text(city.rawValue)
                        }
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .foregroundColor(Colors.ab500)
                    .typography(.base)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                }
                .fixedSize(horizontal: false, vertical: true)
                .onTapGesture {
                    showLocationPicker.toggle()
                }
                .sheet(isPresented: $showLocationPicker){
                    Picker("Lokasi", selection: $city) {
                        ForEach(CityEnum.allCases, id: \.self) { city in
                            Text(city.rawValue)
                                .tag(city)
                        }
                    }
                    .appWheelPicker()
                }
                HStack {
                    Text("Donatur ASI")
                        .typography(.heading2)
                    Spacer()
                    Button {
                    } label: {
                        HStack {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .foregroundColor(Colors.white)
                                .font(.system(size: 15.0))
                            Text("Preferensi")
                                .foregroundColor(Colors.white)
                                .typography(.small)
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Colors.ab500)
                        .cornerRadius(18)
                    }
                }
                .padding(.top, 32)
                ScrollView {
                    ForEach(0 ..< 15) { item in
                        ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0)
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct KatalogView_Previews: PreviewProvider {
    static var previews: some View {
        KatalogView()
    }
}
