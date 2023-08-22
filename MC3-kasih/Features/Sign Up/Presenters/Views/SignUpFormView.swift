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
    
    private var isFinish: Bool {
        stepState == .finish
    }
    
    var body: some View {
        VStack {
            ScrollView {
                if !isFinish {
                    HStack {
                        BackButton {
                            if viewModel.currentStepIndex > 0 {
                                viewModel.previousStep()
                            } else {
                                dismiss()
                            }
                        }
                        Spacer()
                    }
                }
                SignUpStepper(currentStep: viewModel.currentStepIndex + 1,
                              totalSteps: viewModel.steps.count - 1)
                .padding(.top, 4)
                if !isFinish {
                    Text(stepState.rawValue)
                        .typography(.heading2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 8)
                }
                Group {
                    switch stepState {
                    case .biodata:
                        BiodataFormView(viewModel: viewModel)
                    case .documentScreening:
                        SkriningFormView(viewModel: viewModel)
                    case .verification:
                        VerificationFormView(viewModel: viewModel)
                    case .finish:
                        FinishFormView()
                    }
                }
                .padding(.top, 16)
                Spacer()
            }
            Button(isFinish ? "Lanjutkan Permintaan" : "Selanjutnya") {
                viewModel.nextStep()
            }
            .disabled(!viewModel.isValidStep)
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(viewModel.isValidStep ? .appPrimary : .appPrimaryDisable)
            .padding(.top, 16)
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
