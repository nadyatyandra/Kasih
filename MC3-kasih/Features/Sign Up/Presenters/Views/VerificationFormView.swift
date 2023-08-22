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
        VStack(spacing: 24) {
            DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
            TextField("Sex", text: $viewModel.sex)
            TextField("Religion", text: $viewModel.religion)
            TextField("Blood Type", text: $viewModel.bloodType)
        }
    }
}

struct VerificationForm_Previews: PreviewProvider {
    static var previews: some View {
        VerificationFormView(viewModel: SignUpViewModel())
    }
}
