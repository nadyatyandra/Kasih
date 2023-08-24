//
//  SignInView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel: SignInViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Colors.ab100
                .ignoresSafeArea()
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 32)
                    .foregroundColor(Colors.white)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: geometry.size.height * 0.1)
            }
            VStack {
                HStack {
                    BackButton { dismiss() }
                    Spacer()
                }
                Spacer()
                Image("logoKasih")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                VStack(spacing: 24) {
                    InputFieldWrapper(
                        label: "Email",
                        inputField: AnyView(
                            TextField("Email", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                                .textFieldStyle(.app))
                    )
                    InputFieldWrapper(
                        label: "Password",
                        inputField: AnyView(
                            TextField("Password", text: $viewModel.password)
                                .textFieldStyle(.app))
                    )
                }
                HStack {
                    Button(action: {}) {
                        Text("Lupa Password?")
                            .foregroundColor(Colors.ab400)
                            .typography(.smallBold)
                    }
                    Spacer()
                }
                NavigationLink(destination: SelectUserRoleView()) {
                    Text("Daftar")
                }
                .fixedSize(horizontal: false, vertical: true)
                .buttonStyle(.appPrimary)
                .padding(.top)
                HStack {
                    Text("Sudah punya akun?")
                        .typography(.smallBold)
                    Button(action: {}) {
                        Text("Masuk")
                            .foregroundColor(Colors.ab400)
                            .typography(.smallBold)
                    }
                }
                HStack {
                    StepDivider(isActive: true, isSignIn: true)
                    Text("atau")
                        .typography(.smallBold)
                    StepDivider(isActive: true, isSignIn: true)
                }
                .padding(.vertical, 28)
                VStack(spacing: 16) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "apple.logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 12, height: 12)
                            Text("Daftar dengan Apple")
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .buttonStyle(AppButtonStyle(isMedium: true, isApple: true))
                    Button(action: {}) {
                        HStack {
                            Image("iconGoogle")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 18, height: 18)
                            Text("Daftar dengan Google")
                        }
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .buttonStyle(AppButtonStyle(isMedium: true, isGoogle: true))
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}
