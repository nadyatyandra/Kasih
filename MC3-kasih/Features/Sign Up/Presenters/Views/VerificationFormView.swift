//
//  VerificationFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct VerificationFormView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        Section(header: Text(SignUpStep.verification.rawValue)) {
            if viewModel.isSuccess {
                Text("Sign Up Successful!")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
        }
    }
}

struct VerificationForm_Previews: PreviewProvider {
    static var previews: some View {
        VerificationFormView(viewModel: SignUpViewModel())
    }
}