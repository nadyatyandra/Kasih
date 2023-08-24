//
//  KatalogView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct KatalogView: View {
    @StateObject var viewModel = KatalogViewModel(userRepo: UserRepository())
    @State private var showLocationPicker = false
    @State private var showTempUsers = false

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
                    Button(action: { showTempUsers.toggle() }) {
                        Text("Kasih")
                            .typography(.title)
                    }
                    .sheet(isPresented: $showTempUsers){
                        VStack {
                            Text("USERS")
                            ForEach(viewModel.users, id: \.id) { user in
                                NavigationLink {
                                    EmptyView()
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text(user.name ?? "sss")
                                            .fontWeight(.semibold)
                                            .font(.headline)
                                        Text("id: \(user.id?.uuidString ?? "x")")
                                            .font(.body)
                                        Text("baby gender: \(ReligionEnum.fromString(user.religion)?.rawValue ?? "")")
                                            .font(.body)
                                        ForEach(user.lifestyleList) { lifesyle in
                                            Text("Lifestyle: \(lifesyle.name ?? "x")")
                                                .font(.caption)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                        .onAppear {
                            viewModel.loadUsers()
                        }
                    }
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
                            Text(viewModel.selectedCity.rawValue)
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
                    Picker("Lokasi", selection: $viewModel.selectedCity) {
                        ForEach(CityEnum.toList(), id: \.self) { city in
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
                        NavigationLink(destination: DetailDonorView()) {
                            ASICardComponent(asiImg: "placeholder", quantity: 20.0, pouchSize: 25.0, dateProd: "Agustus 2023", user: "Susi Susanti", distance: 3.0)
                        }
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
