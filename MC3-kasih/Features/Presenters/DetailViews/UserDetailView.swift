//
//  UserDetailView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 20/08/23.
//

import SwiftUI

struct UserDetailView: View {
    
    @EnvironmentObject var dataController: CoreDataManager
    @Environment(\.managedObjectContext) var managedObjectContext
    
    let user : User
    
    var asis : [Asi]
    
    @State private var showingAddAsi : Bool = false
    
    init(user : User) {
        self.user = user
        
        self.asis = user.asi?.allObjects as! [Asi]
//        self.asis = self.asis.sorted(by: {$0.pouchSize < $1.pouchSize})
    }
    
    var body: some View {
        Form {
            Section (header: Text("Asi")) {
                List {
                    ForEach(asis) { asi in
                        NavigationLink {
                            AsiDetailView(asi: asi)
                        } label: {
                            Label(String(asi.quantity) + " pouch(es)", systemImage: "bolt.fill")
//                            Label(DateFormatter.string(from: asi.dateProd ?? "2023-01-05"), systemImage: "bolt.fill")
//                            Label("TEST", systemImage: "bolt.fill")
                        }
                    }
                    .onDelete(perform: deleteAsi)
                    Button  {
                        self.showingAddAsi = true
                    } label: {
                        Text("Add Asi")
                    }
                }
            }
        }
        .navigationTitle(Text("Details"))
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingAddAsi) {
            AddNewAsiView(user: self.user)
        }
    }
    
    func deleteAsi( at offsets : IndexSet) {
        for offset in offsets {
                let asi = asis[offset]
                dataController.delete(asi)
            }
            dataController.save()
    }
}

struct UserDetailView_Previews: PreviewProvider {
    
    static var dataController = CoreDataManager.preview
    
    static var previews: some View {
        let user = User(context: dataController.container.viewContext)
        
        return UserDetailView(user: user)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
