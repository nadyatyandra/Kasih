//
//  SkriningFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct SkriningFormView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        Section(header: Text(SignUpStep.documentScreening.rawValue)) {
            DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
            TextField("Sex", text: $viewModel.sex)
            TextField("Religion", text: $viewModel.religion)
            TextField("Blood Type", text: $viewModel.bloodType)
        }
    }
}

struct SkriningForm_Previews: PreviewProvider {
    static var previews: some View {
        SkriningFormView(viewModel: SignUpViewModel())
    }
}
