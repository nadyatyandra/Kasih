//
//  SelectUserRoleView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct SelectUserRoleView: View {
    @Binding var path: NavigationPath
    @StateObject private var viewModel = SignUpViewModel()
    @State private var showRoleSheet = false
    @State private var selectedRole: UserRoleEnum = .donator

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
                    viewModel.role = selectedRole
                    path.append("SignUpFormView")
                }
                .presentationDetents([.medium])
                .padding()
            }

            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
        .navigationDestination(for: String.self) { view in
            if view == "SignUpFormView" {
                SignUpFormView(viewModel: viewModel)
            }
        }
    }
}

struct SelectUserRoleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectUserRoleView(path: .constant(NavigationPath()))
    }
}
