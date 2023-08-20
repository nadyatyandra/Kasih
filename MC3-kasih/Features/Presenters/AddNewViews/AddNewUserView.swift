//
//  AddNewUserView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 20/08/23.
//

import SwiftUI

enum ActiveAlertUser {
    case first, second, zero
}

struct AddNewUserView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var dataController : CoreDataManager
    
    @State private var name : String = ""
    @State private var email: String = ""
    
    @State private var showAlert : Bool = false
    @State private var activeAlert: ActiveAlertUser = .zero
    
    var body: some View {
        NavigationView {
            Form {
                Section (header : Text("Name")) {
                    TextField("Enter name", text: $name)
                }
                Section (header: Text("Email")) {
                    TextField("Enter email", text: $email)
                }
            }
            .navigationTitle("Add new User")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Dismiss")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        saveButton()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                switch activeAlert {
                case .first:
                    return Alert(title: Text("Name is empty"), message: Text("Enter name"), dismissButton: .default(Text("OK")))
                case .second:
                    return Alert(title: Text("Email is empty"), message: Text("Enter email"), dismissButton: .default(Text("OK")))
                case .zero:
                    return Alert(title: Text("Incorrect data"), dismissButton: .default(Text("OK")))
                }
            }
        }
    }
    
    func saveButton(){
        
        //Validation for textfields
        if self.name.isEmpty {
            self.activeAlert = .first
            self.showAlert = true
        }
        else if  self.email.isEmpty{
            self.activeAlert = .second
            self.showAlert = true
        }
        
        else {
            let user = User(context: dataController.container.viewContext)
            
            user.id = UUID()
            user.name = self.name
            user.email = self.email
            
            dataController.save()
            
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddNewUserView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewUserView()
    }
}
