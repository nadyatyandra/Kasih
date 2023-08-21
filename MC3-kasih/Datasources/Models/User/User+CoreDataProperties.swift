//
//  User+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var role: String?
    @NSManaged public var name: String?
    @NSManaged public var profileImg: Data?
    @NSManaged public var selfieImg: Data?
    @NSManaged public var email: String?
    @NSManaged public var phoneNum: String?
    @NSManaged public var religion: String?
    @NSManaged public var ktpImg: Data?
    @NSManaged public var babyGender: String?
    @NSManaged public var location: Location?
    @NSManaged public var medicalScreen: MedicalScreen?
    @NSManaged public var asiList: NSSet?
    @NSManaged public var transactions: NSSet?
    @NSManaged public var childs: NSSet?
    @NSManaged public var lifestyles: NSSet?

}

// MARK: Generated accessors for asiList
extension User {

    @objc(addAsiListObject:)
    @NSManaged public func addToAsiList(_ value: Asi)

    @objc(removeAsiListObject:)
    @NSManaged public func removeFromAsiList(_ value: Asi)

    @objc(addAsiList:)
    @NSManaged public func addToAsiList(_ values: NSSet)

    @objc(removeAsiList:)
    @NSManaged public func removeFromAsiList(_ values: NSSet)

}

// MARK: Generated accessors for transactions
extension User {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: Transaction)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: Transaction)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

// MARK: Generated accessors for childs
extension User {

    @objc(addChildsObject:)
    @NSManaged public func addToChilds(_ value: Child)

    @objc(removeChildsObject:)
    @NSManaged public func removeFromChilds(_ value: Child)

    @objc(addChilds:)
    @NSManaged public func addToChilds(_ values: NSSet)

    @objc(removeChilds:)
    @NSManaged public func removeFromChilds(_ values: NSSet)

}

// MARK: Generated accessors for lifestyles
extension User {

    @objc(addLifestylesObject:)
    @NSManaged public func addToLifestyles(_ value: Lifestyle)

    @objc(removeLifestylesObject:)
    @NSManaged public func removeFromLifestyles(_ value: Lifestyle)

    @objc(addLifestyles:)
    @NSManaged public func addToLifestyles(_ values: NSSet)

    @objc(removeLifestyles:)
    @NSManaged public func removeFromLifestyles(_ values: NSSet)

}

extension User : Identifiable {

}
