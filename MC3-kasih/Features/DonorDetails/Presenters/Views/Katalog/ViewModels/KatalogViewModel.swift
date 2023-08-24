//
//  KatalogViewModel.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 24/08/23.
//

import Foundation

class KatalogViewModel: ObservableObject {
    private let userRepo: UserRepository

    @Published var users: [User] = []
    @Published var selectedCity: CityEnum = .jakarta

    init(userRepo: UserRepository) {
        self.userRepo = userRepo
    }

    func loadUsers() {
        users = userRepo.getAllUsers()
    }
}
