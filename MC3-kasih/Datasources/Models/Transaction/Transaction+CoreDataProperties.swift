//
//  Transaction+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?
    @NSManaged public var pickUpDate: Date?
    @NSManaged public var statusList: NSSet?
    @NSManaged public var buyer: User?
    @NSManaged public var asi: Asi?

}

// MARK: Generated accessors for statusList
extension Transaction {

    @objc(addStatusListObject:)
    @NSManaged public func addToStatusList(_ value: TransactionStatus)

    @objc(removeStatusListObject:)
    @NSManaged public func removeFromStatusList(_ value: TransactionStatus)

    @objc(addStatusList:)
    @NSManaged public func addToStatusList(_ values: NSSet)

    @objc(removeStatusList:)
    @NSManaged public func removeFromStatusList(_ values: NSSet)

}

extension Transaction : Identifiable {

}
