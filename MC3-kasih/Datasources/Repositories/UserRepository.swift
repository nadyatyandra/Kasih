//
//  UserRepository.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 24/08/23.
//

import Foundation
import CoreData

class UserRepository {
    private let stack = CoreDataStack.shared

    func getAllUsers() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()

        do {
            return try stack.viewContext.fetch(request)
        } catch {
            return []
        }
    }

    func getLoggedInUser() -> User? {
        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "isLogin == true")

        do {
            return try stack.viewContext.fetch(request).first
        } catch {
            return nil
        }
    }

    func createUser(
        role: String?,
        name: String?,
        email: String?,
        phoneNum: String?,
        city: String?,
        ktp: Data? = nil,
        selfie: Data? = nil,
        babyDOB: Date?,
        babyGender: String?,
        religion: String?,
        bloodType: String?,
        lifestyle: [String],
        recipientReason: String?,
        babyBirthWeek: Int = 0,
        babyWeight: Double = 0.0,
        isScreened: Bool,
        vaccine: String?,
        drugs: String?,
        donatorReason: String?
    ) {
        let user = User(context: stack.viewContext)
        user.id = UUID()
        user.role = role
        user.name = name
        user.email = email
        user.phoneNum = phoneNum
        user.city = city
        user.ktpImg = ktp
        user.selfieImg = selfie
        user.religion = religion
        user.recipientReason = recipientReason
        user.isScreened = isScreened
        user.vaksin = vaccine
        user.drugs = drugs
        user.donorsReason = donatorReason

        addBaby(to: user, babyDOB: babyDOB, bloodType: bloodType, babyGender: babyGender, babyBirthWeek: babyBirthWeek, babyWeight: babyWeight)

        addLifestyles(to: user, lifestyles: lifestyle)

        user.isLogin = true

        stack.saveContext()
    }

    func logOut(_ user: User){
        user.isLogin = false
        stack.saveContext()
    }

    func deleteUser(_ user: User) {
        stack.viewContext.delete(user)
        stack.saveContext()
    }

    private func addBaby(
        to user: User,
        babyDOB: Date?,
        bloodType: String?,
        babyGender: String?,
        babyBirthWeek: Int,
        babyWeight: Double
    ) {
        let baby = Baby(context: stack.viewContext)
        baby.id = UUID()
        baby.bloodType = bloodType
        baby.dateOfBirth = babyDOB
        baby.gender = babyGender
        baby.weekOfBirth = Int16(babyBirthWeek)
        baby.weightOfBirth = babyWeight

        user.baby = baby
    }

    private func addLifestyles(to user: User, lifestyles: [String]) {
        for name in lifestyles {
            let lifestyle = Lifestyle(context: stack.viewContext)
            lifestyle.id = UUID()
            lifestyle.name = name
            user.addToLifestyles(lifestyle)
        }
    }
}
