//
//  Lifestyle+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension Lifestyle {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lifestyle> {
        return NSFetchRequest<Lifestyle>(entityName: "Lifestyle")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var user: User?

}

extension Lifestyle : Identifiable {

}
