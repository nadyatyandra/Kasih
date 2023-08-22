//
//  SignUpStepper.swift
//  MC3-kasihv
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct SignUpStepper: View {
    var currentStep: Int
    var totalSteps: Int

    private func isActive(_ step: Int) -> Bool {
        return step <= currentStep
    }

    var body: some View {
        HStack(spacing: 0) {
            ForEach(1...totalSteps, id: \.self) { step in
                    StepIndicator(index: step, isActive: isActive(step))
                if step < totalSteps {
                    StepDivider(isActive: isActive(step))
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
