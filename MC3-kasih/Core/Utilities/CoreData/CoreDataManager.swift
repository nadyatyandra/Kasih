//
//  CoreDataManager.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 20/08/23.
//

import Foundation
import CoreData
import SwiftUI


class CoreDataManager : ObservableObject {
    let container : NSPersistentCloudKitContainer
    
    init() {
        container = NSPersistentCloudKitContainer(name: "Models")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error loading Core Data stores \(error.localizedDescription)")
            }
        }
    }
    
    func createSampleData() {
        let viewContext = container.viewContext
        
        let user = User(context: viewContext)
        user.id = UUID()
        user.role = "Donor"
        user.religion = "Moslem"
        user.phoneNum = "08123456789"
        user.name = "Anita"
        user.email = "anita@gmail.com"
        user.bloodType = "A"
        
        let asi1 = Asi(context: viewContext)
        asi1.id = UUID()
        asi1.dateProd = Date()
//        asi1.dateProd = "Senin"
        asi1.pouchSize = 120.0
        asi1.quantity = 10
        asi1.user = user
        
        let asi2 = Asi(context: viewContext)
        asi2.id = UUID()
        asi2.dateProd = Date()
//        asi2.dateProd = "Senin"
        asi2.pouchSize = 150.0
        asi2.quantity = 15
        asi2.user = user
        
        let asi3 = Asi(context: viewContext)
        asi3.id = UUID()
        asi3.dateProd = Date()
//        asi3.dateProd = "Senin"
        asi3.pouchSize = 120.0
        asi3.quantity = 15
        asi3.user = user
        
        do {
            try viewContext.save()
        }
        catch {
            fatalError("Unable to load sample data: \(error.localizedDescription)")
        }
    }
    
    func save() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            }
            catch {
                fatalError("Unable to save data: \(error.localizedDescription)")
            }
        }
    }

    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
    
    func deleteAll() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = User.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        _ = try? container.viewContext.execute(batchDeleteRequest)
    }
    
    static var preview : CoreDataManager = {
        let dataController = CoreDataManager()
        let viewContext = dataController.container.viewContext

        dataController.createSampleData()
        return dataController
    }()
}
