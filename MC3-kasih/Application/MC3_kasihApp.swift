//
//  MC3_kasihApp.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 15/08/23.
//

import SwiftUI
import CoreData

@main
struct MC3_kasihApp: App {
    
    @StateObject var dataController : CoreDataManager
    
    init() {
        let dataController = CoreDataManager()
        _dataController = StateObject(wrappedValue: dataController)
    }

    var body: some Scene {
        WindowGroup {
            UserListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
