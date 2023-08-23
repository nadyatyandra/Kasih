//
//  SignUpViewModels.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import Foundation
import Combine
import PhotosUI

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
    @Published var selfie: UIImage? = nil
    @Published var ktp: UIImage? = nil
    @Published var lifeStyle: [Chip] = [
        Chip(value: "Halal", isSelected: false),
        Chip(value: "Produk Susu", isSelected: false),
        Chip(value: "Telur", isSelected: false),
        Chip(value: "Gluten", isSelected: false),
        Chip(value: "Vegan", isSelected: false),
        Chip(value: "Vegetarian", isSelected: false),
        Chip(value: "Kacang-kacangan", isSelected: false),
        Chip(value: "Kafein", isSelected: false),
        Chip(value: "Seafood", isSelected: false),
        Chip(value: "Tempe dan Tahu", isSelected: false),
        Chip(value: "Merokok", isSelected: false),
        Chip(value: "Alkohol", isSelected: false),
    ]


    let steps: [SignUpStep] = [.biodata, .documentScreening, .verification, .finish]
    @Published var currentStepIndex = 0

    var isValidStep: Bool {
        switch steps[currentStepIndex] {
        case .biodata:
            return !name.isEmpty && !location.isEmpty && !phoneNumber.isEmpty && !email.isEmpty
        case .documentScreening:
            return selfie != nil && ktp != nil
        case .verification:
            return !sex.isEmpty && !religion.isEmpty && !bloodType.isEmpty
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
            if currentStepIndex >= 1 {
                resetImagePickers()
            }
            currentStepIndex -= 1
        }
    }

    private func resetImagePickers() {
        selfie = nil
        ktp = nil
    }

    private func submitForm() {
        // Implement your form submission logic here
        print("Submitted")
    }
}
