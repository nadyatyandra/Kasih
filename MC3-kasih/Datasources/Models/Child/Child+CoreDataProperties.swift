//
//  Child+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var gender: String?
    @NSManaged public var weekOfBirth: Double
    @NSManaged public var weightOfBirth: Double
    @NSManaged public var bloodType: String?
    @NSManaged public var user: User?

}

extension Child : Identifiable {

}
