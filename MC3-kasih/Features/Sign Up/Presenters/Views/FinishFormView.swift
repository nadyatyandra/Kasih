//
//  FinishFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct FinishFormView: View {
    let role: String

    var body: some View {
        VStack {
            Spacer()
            Text(SignUpStep.finish.rawValue + role)
                .multilineTextAlignment(.center)
                .typography(.heading2)
            Spacer()
        }
    }
}

struct FinishFormView_Previews: PreviewProvider {
    static var previews: some View {
        FinishFormView(role: "Donatur")
    }
}
