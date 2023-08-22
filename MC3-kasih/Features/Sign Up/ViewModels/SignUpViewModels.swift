//
//  SignUpViewModels.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import Foundation
import Combine

enum SignUpStep: String, CaseIterable {
    case biodata = "Biodata"
    case documentScreening = "Skrining Dokumen"
    case verification = "Verifikasi Resipien"
    case finish = "Kamu berhasil mendaftar sebagai Resipien"

}

class SignUpViewModel: ObservableObject {
    @Published var name = ""
    @Published var location = ""
    @Published var phoneNumber = ""
    @Published var email = ""
    @Published var dateOfBirth = Date()
    @Published var sex = ""
    @Published var religion = ""
    @Published var bloodType = ""

    let steps: [SignUpStep] = [.biodata, .documentScreening, .verification, .finish]
    @Published var currentStepIndex = 0

    var isValidStep: Bool {
        switch steps[currentStepIndex] {
        case .biodata:
            return !name.isEmpty && !location.isEmpty && !phoneNumber.isEmpty && !email.isEmpty
        case .documentScreening:
            return !sex.isEmpty && !religion.isEmpty && !bloodType.isEmpty
        case .verification:
            return true
        case .finish:
            return true
        }
    }

    func nextStep() {
        if currentStepIndex < steps.count - 1 {
            currentStepIndex += 1
        } else if currentStepIndex == steps.count - 1 {
            submitForm()
        }
    }

    func previousStep() {
        if currentStepIndex > 0 {
            currentStepIndex -= 1
        }
    }

    func submitForm() {
        // Implement your form submission logic here
        print("Submitted")
    }
}
