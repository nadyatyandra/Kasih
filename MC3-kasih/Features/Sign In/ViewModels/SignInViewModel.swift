//
//  SignInViewModel.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import Foundation

class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    var isValidStep: Bool {
        return !email.isEmpty && !password.isEmpty
    }
}
