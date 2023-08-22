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
        VStack() {
            if !viewModel.isSuccess {
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
                          totalSteps: viewModel.steps.count)
            .padding(.top, 4)
            if !viewModel.isSuccess {
                Text(stepState.rawValue)
                    .typography(.heading2)
                    .frame(maxWidth: .infinity, alignment: .leading)
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
            } else {
                Spacer()
                Text("Kamu sudah terdaftar sebagai Resipien")
                    .multilineTextAlignment(.center)
                    .typography(.heading2)
            }
            Spacer()
            Button(viewModel.isSuccess ? "Lanjutkan Permintaan" : "Selanjutnya") {
            }
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(.app)
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
