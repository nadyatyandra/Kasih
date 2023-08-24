//
//  SignUpViewModel.swift
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
    case healthScreening = "Skrining Kesehatan"
    case finish = "Kamu berhasil mendaftar sebagai "
}

class SignUpViewModel: ObservableObject {
    private let userRepo: UserRepository

    init(userRepo: UserRepository) {
        self.userRepo = userRepo
    }

    @Published var role: UserRoleEnum?
    @Published var name = ""
    @Published var email = ""
    @Published var phoneNumber = ""
    @Published var city: CityEnum = .none

    @Published var ktp: UIImage?
    @Published var selfie: UIImage?

    @Published var babyDOB: Date?
    @Published var babyGender: GenderEnum = .none

    @Published var religion: ReligionEnum = .none
    @Published var bloodType: BloodTypeEnum = .none
    @Published var lifestyle: [String] = []

    // Recipient only
    @Published var recipientReason = ""

    // Donator only
    @Published var babyBirthWeek: Int = 0
    @Published var babyWeight: Double = 0.0
    @Published var isScreened: Bool = false
    @Published var vacinne: VaccineEnum = .none
    @Published var drugs = ""
    @Published var donatorReason = ""


    @Published var lifestyleChips: [Chip] = [
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

    @Published var isCompleted = false

    var signUpStep: [SignUpStep] {
        return [.biodata, .documentScreening, .verification] + (role == .recipient ? [] : [.healthScreening]) + [.finish]
    }


    @Published var currentStepIndex = 0

    var isValidStep: Bool {
        switch signUpStep[currentStepIndex] {
        case .biodata:
//            return !name.isEmpty && !email.isEmpty && !phoneNumber.isEmpty && city != .none
            return true
        case .documentScreening:
//            return ktp != nil && selfie != nil
            return true
        case .verification:
//            return babyDOB != nil && babyGender != .none && religion != .none && bloodType != .none && (role == .donator ? (babyBirthWeek != 0 && babyWeight != 0.0 && vacinne != .none) : true)
            return true
        case .healthScreening:
            return true
        case .finish:
            return true
        }
    }

    func nextStep() {
        if currentStepIndex < signUpStep.count - 1 {
            currentStepIndex += 1
        } else if currentStepIndex == signUpStep.count - 1 {
            createUser()
            isCompleted.toggle()
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

    func babyBirthWeekString() -> String {
        if babyBirthWeek != 0 {
            return "\(babyBirthWeek) Minggu"
        } else {
            return ""
        }
    }

    func babyBirthWeightString() -> String {
        if babyBirthWeek != 0 {
            return String(format: "%.1f Kg", babyWeight)
        } else {
            return ""
        }
    }

    func babyGenderString() -> String {
        if babyGender != .none {
            return babyGender.rawValue
        } else {
            return ""
        }
    }

    func religionString() -> String {
        if religion != .none {
            return religion.rawValue
        } else {
            return ""
        }
    }

    func bloodTypeString() -> String {
        if bloodType != .none {
            return bloodType.rawValue
        } else {
            return ""
        }
    }

    func vaccineString() -> String {
        if vacinne != .none {
            return vacinne.rawValue
        } else {
            return ""
        }
    }

    func cityString() -> String {
        if city != .none {
            return city.rawValue
        } else {
            return ""
        }
    }


    private func resetImagePickers() {
        selfie = nil
        ktp = nil
    }

    private func createUser() {
        var selfieData: Data? = nil
        if let img = selfie {
            selfieData = img.pngData()
        }

        var ktpData: Data? = nil
        if let img = ktp {
            ktpData = img.pngData()
        }

        print("LIFESTYLE: \(lifestyle)")

        userRepo.createUser(
            role: role?.rawValue,
            name: name,
            email: email,
            phoneNum: phoneNumber,
            city: city.rawValue,
            ktp: ktpData,
            selfie: selfieData,
            babyDOB: babyDOB,
            babyGender: babyGender.rawValue,
            religion: religion.rawValue,
            bloodType: bloodType.rawValue,
            lifestyle: lifestyle,
            recipientReason: recipientReason,
            isScreened: isScreened,
            vaccine: vacinne.rawValue,
            drugs: drugs,
            donatorReason: donatorReason
        )
    }

    func handleChipSelection(chipIndex: Int) {
        lifestyleChips[chipIndex].isSelected.toggle()
        updateSelectedLifestyle()
    }

    private func updateSelectedLifestyle() {
        let selectedLifestyleValues = lifestyleChips.filter { $0.isSelected }.map { $0.value }
        lifestyle = selectedLifestyleValues
    }
}
