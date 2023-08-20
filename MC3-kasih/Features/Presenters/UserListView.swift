//
//  UserListView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 15/08/23.
//

import SwiftUI
import CoreData

struct UserListView: View {
    @EnvironmentObject var dataController : CoreDataManager
    
    let users : FetchRequest<User>
    
    @State var showingAddUser : Bool = false
    
    init(){
        users = FetchRequest<User>(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.id, ascending: false)])
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    List {
                        ForEach(users.wrappedValue) { user in
                            NavigationLink (destination: UserDetailView(user: user)){
                                VStack(alignment: .leading) {
                                    Text(user.name ?? "").font(.headline)
                                    Spacer()
                                    Text("\(user.email ?? "")").font(.subheadline)
                                }.padding()
                            }
                        }
                        .onDelete(perform: deleteUser)
                    }
                    .listStyle(InsetGroupedListStyle())
                }
                
            }
            .navigationTitle("User")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Add Sample Data") {
                        dataController.createSampleData()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showingAddUser = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddUser) {
                AddNewUserView()
            }
        }
    }
    
    func deleteUser( at offsets : IndexSet) {
        for offset in offsets {
            let user = users.wrappedValue[offset]
            dataController.delete(user)
        }
        dataController.save()
    }
}

struct UserListView_Previews: PreviewProvider {
    static var dataController = CoreDataManager.preview
    static var previews: some View {
        
        UserListView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
