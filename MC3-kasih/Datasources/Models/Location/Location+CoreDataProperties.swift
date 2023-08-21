//
//  Location+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var zipCode: String?
    @NSManaged public var user: User?

}

extension Location : Identifiable {

}
