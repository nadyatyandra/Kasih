//
//  MedicalScreen+CoreDataProperties.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//
//

import Foundation
import CoreData


extension MedicalScreen {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MedicalScreen> {
        return NSFetchRequest<MedicalScreen>(entityName: "MedicalScreen")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isHIV: Bool
    @NSManaged public var idHepatitis: Bool
    @NSManaged public var isSyphilis: Bool
    @NSManaged public var isIgM: Bool
    @NSManaged public var isDrug: Bool
    @NSManaged public var isDiet: Bool
    @NSManaged public var isBloodTrans: Bool
    @NSManaged public var isOrganTrans: Bool
    @NSManaged public var medHistory: String?
    @NSManaged public var vitamins: String?
    @NSManaged public var documents: NSSet?
    @NSManaged public var user: User?

}

// MARK: Generated accessors for documents
extension MedicalScreen {

    @objc(addDocumentsObject:)
    @NSManaged public func addToDocuments(_ value: TestResult)

    @objc(removeDocumentsObject:)
    @NSManaged public func removeFromDocuments(_ value: TestResult)

    @objc(addDocuments:)
    @NSManaged public func addToDocuments(_ values: NSSet)

    @objc(removeDocuments:)
    @NSManaged public func removeFromDocuments(_ values: NSSet)

}

extension MedicalScreen : Identifiable {

}
