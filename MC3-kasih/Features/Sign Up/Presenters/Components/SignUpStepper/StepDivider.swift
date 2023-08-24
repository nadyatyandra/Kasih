//
//  StepDivider.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct StepDivider: View {
    let isActive: Bool

    var body: some View {
        Capsule()
            .fill(isActive ? Colors.ab400 : Colors.white)
            .frame(height: 6)
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct StepDivider_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StepDivider(isActive: true)
            StepDivider(isActive: false)
        }
        .frame(width: 200)
        .previewLayout(.sizeThatFits)
    }
}
