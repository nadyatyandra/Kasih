//
//  SelectUserRoleView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct SelectUserRoleView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @State private var showRoleSheet = false
    @State private var selectedRole: UserRoleEnum = .donator
    @State private var isLanjut = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            HStack {
                BackButton { dismiss() }
                Spacer()
            }
            Text("Saya ingin menjadi...")
                .typography(.heading2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 24)

            ForEach(UserRoleEnum.allCases, id: \.self) { role in
                RoleOptionCard(role: role, isSelected: selectedRole == role) {
                    selectedRole = role
                    showRoleSheet.toggle()
                }
                .padding(.top, 24)
            }
            .sheet(isPresented: $showRoleSheet) {
                RoleInfoSheet(role: selectedRole) {
                    isLanjut.toggle()
                    viewModel.role = selectedRole
                }
                .presentationDetents([.medium])
                .padding()
            }
            Spacer()

            NavigationLink(destination:
                            SignUpFormView(viewModel: viewModel),
                           isActive: $isLanjut){}
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct SelectUserRoleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectUserRoleView()
    }
}
