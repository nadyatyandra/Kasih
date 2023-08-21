//
//  TransactionStatus+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension TransactionStatus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionStatus> {
        return NSFetchRequest<TransactionStatus>(entityName: "TransactionStatus")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var transaction: Transaction?

}

extension TransactionStatus : Identifiable {

}
