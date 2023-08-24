//
//  PreferensiViewModel.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import Foundation

class PreferensiViewModel: ObservableObject {
    @Published var religion: ReligionEnum = .none
    @Published var bloodType: BloodTypeEnum = .none
    @Published var babyGender: GenderEnum = .none
    @Published var keperluanSkrining: KeperluanEnum = .none
    @Published var lifestyle: [String] = []
    
    func keperluanString() -> String {
        if keperluanSkrining != .none {
            return keperluanSkrining.rawValue
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
    
    func handleChipSelection(chipIndex: Int) {
        lifestyleChips[chipIndex].isSelected.toggle()
        updateSelectedLifestyle()
    }
    
    private func updateSelectedLifestyle() {
        let selectedLifestyleValues = lifestyleChips.filter { $0.isSelected }.map { $0.value }
        lifestyle = selectedLifestyleValues
    }
}
