//
//  TestResult+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension TestResult {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TestResult> {
        return NSFetchRequest<TestResult>(entityName: "TestResult")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var document: Data?
    @NSManaged public var date: Date?
    @NSManaged public var medicalScreen: MedicalScreen?

}

extension TestResult : Identifiable {

}
