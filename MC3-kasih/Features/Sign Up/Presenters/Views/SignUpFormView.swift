//
//  SignUpFormView.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct SignUpFormView: View {
    @ObservedObject var viewModel: SignUpViewModel
    @State private var isComplete = false

    @Environment(\.dismiss) private var dismiss
    
    private var stepState: SignUpStep {
        viewModel.signUpStep[viewModel.currentStepIndex]
    }
    
    private var isFinish: Bool {
        stepState == .finish
    }
    
    var body: some View {
        VStack {
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
                          totalSteps: viewModel.signUpStep.count - 1)
            .padding(.top, 4)
            if !isFinish {
                Text(stepState.rawValue)
                    .typography(.heading2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8)
            }
            switch stepState {
            case .biodata:
                BiodataFormView(viewModel: viewModel)
            case .documentScreening:
                SkriningFormView(viewModel: viewModel)
            case .verification:
                VerificationFormView(viewModel: viewModel)
            case .healthScreening:
                SkriningKesehatanView(viewModel: viewModel)
            case .finish:
                FinishFormView(role: viewModel.role?.rawValue ?? "")
            }
            Spacer()
            Button(isFinish ? "Selesai" : "Selanjutnya") {
                viewModel.nextStep()

                if isFinish {
                    isComplete.toggle()
                }
            }
            .disabled(!viewModel.isValidStep)
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(viewModel.isValidStep ? .appPrimary : .appPrimaryDisable)
            .padding(.top)

            NavigationLink(destination: KatalogView(), isActive: $isComplete){}

        }
        .padding()
        .navigationBarBackButtonHidden()
        .toolbar(.hidden)
    }
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView(viewModel: SignUpViewModel())
    }
}
