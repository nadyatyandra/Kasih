//
//  StepIndicator.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct StepIndicator: View {
    let currentStep: Int
    let index: Int
    

    private var isActive: Bool {
        index <= currentStep
    }

    var body: some View {
        Circle()
            .frame(width: 24)
            .foregroundColor(isActive ? Colors.ab400 : Colors.white)
            .overlay {
                Circle()
                    .strokeBorder(Colors.ab400, lineWidth: 2)
                Group {
                    if currentStep > index {
                        Image(systemName: "checkmark")
                    } else {
                        Text("\(index)")
                    }
                }
                .foregroundColor(isActive ? Colors.white : Colors.ab400)
                .typography(.smallBold)
            }
    }
}

struct StepIndicator_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StepIndicator(currentStep: 2, index: 1)
            StepIndicator(currentStep: 2, index: 2)
            StepIndicator(currentStep: 2, index: 3)
        }
        .previewLayout(.sizeThatFits)
    }
}

