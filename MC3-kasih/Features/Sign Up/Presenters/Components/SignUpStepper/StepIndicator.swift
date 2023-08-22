//
//  StepIndicator.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct StepIndicator: View {
    var index: Int
    var isActive: Bool

    var body: some View {
        Circle()
            .frame(width: 24)
            .foregroundColor(isActive ? Colors.ab400 : Colors.white)
            .overlay {
                Circle()
                    .strokeBorder(Colors.ab400, lineWidth: 2)
                Text("\(index)")
                    .foregroundColor(isActive ? Colors.white : Colors.ab400)
                    .typography(.smallBold)
            }
    }
}

struct StepIndicator_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StepIndicator(index: 1, isActive: true)
            StepIndicator(index: 2, isActive: false)
        }
        .previewLayout(.sizeThatFits)
    }
}

