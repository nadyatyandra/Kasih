//
//  SignUpFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct SignUpFormView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.dismiss) private var dismiss

    private var stepState: SignUpStep {
        viewModel.steps[viewModel.currentStepIndex]
    }

    var body: some View {
        VStack(alignment: .leading) {
            BackButton {
                if viewModel.currentStepIndex > 0 {
                    viewModel.previousStep()
                } else {
                    dismiss()
                }
            }
            SignUpStepper(currentStep: viewModel.currentStepIndex + 1,
                          totalSteps: viewModel.steps.count)
            .padding(.top, 4)
            Text(stepState.rawValue)
                .typography(.heading2)
                .padding(.top, 8)
            Group {
                switch stepState {
                case .biodata:
                    BiodataFormView(viewModel: viewModel)
                case .documentScreening:
                    SkriningFormView(viewModel: viewModel)
                case .verification:
                    VerificationFormView(viewModel: viewModel)
                }
            }
            .padding(.top, 24)
            Spacer()
            if viewModel.currentStepIndex < viewModel.steps.count - 1 {
                Button("Next") {
                    viewModel.nextStep()
                }
                .disabled(!viewModel.isValidStep)
                .padding()
            } else {
                Button("Done") {
                    viewModel.submitForm()
                }
                .padding()
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
    }
}
