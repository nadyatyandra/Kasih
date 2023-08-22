//
//  BiodataFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct BiodataFormView: View {
    @ObservedObject var viewModel: SignUpViewModel

    var body: some View {
        Section(header: Text(SignUpStep.biodata.rawValue)) {
            TextField("Name", text: $viewModel.name)
            TextField("Location", text: $viewModel.location)
            TextField("Phone Number", text: $viewModel.phoneNumber)
                .keyboardType(.numberPad)
            TextField("Email", text: $viewModel.email)
                .keyboardType(.emailAddress)
        }
    }
}

struct BiodataForm_Previews: PreviewProvider {
    static var previews: some View {
        BiodataFormView(viewModel: SignUpViewModel())
    }
}
