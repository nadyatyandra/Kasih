//
//  SignUpStepper.swift
//  MC3-kasihv
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct SignUpStepper: View {
    let currentStep: Int
    let totalSteps: Int

    var body: some View {
        HStack(spacing: 0) {
            ForEach(1...totalSteps, id: \.self) { step in
                StepIndicator(currentStep: currentStep, index: step)
                if step < totalSteps {
                    StepDivider(isActive: step+1 <= currentStep)
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}

struct SignUpStepper_Previews: PreviewProvider {
    static var previews: some View {
        SignUpStepper(currentStep: 1, totalSteps: 3)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
