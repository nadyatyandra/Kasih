//
//  Asi+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension Asi {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Asi> {
        return NSFetchRequest<Asi>(entityName: "Asi")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var photo: Data?
    @NSManaged public var dateProd: Date?
    @NSManaged public var quantity: Double
    @NSManaged public var pouchSize: Double
    @NSManaged public var user: User?
    @NSManaged public var transaction: Transaction?

}

extension Asi : Identifiable {

}
