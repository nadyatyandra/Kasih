//
//  AddNewAsiView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 20/08/23.
//

import SwiftUI

enum ActiveAlertAsi {
    case first, second, third, zero
}

struct AddNewAsiView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    @EnvironmentObject var dataController : CoreDataManager
    
    let user : User
    
    @State private var showAlert : Bool = false
    @State private var activeAlert : ActiveAlertAsi = .zero
    
    @State private var quantity = ""
    @State private var pouchSize = ""
    @State private var dateProd = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Quantity")) {
                    TextField("Enter a quantity", text: $quantity)
                }
                Section (header: Text("Pouch Size")) {
                    TextField("Enter pouch size", text: $pouchSize)
                }
                Section (header: Text("Date Production")) {
                    TextField("Enter date production", text: $dateProd)
                }
            }
            .navigationTitle("Add New Asi")
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
            .alert(isPresented : $showAlert) {
                switch activeAlert {
                case .first:
                    return Alert(title: Text("Quantity is empty"), message: Text("Please enter quantity"), dismissButton: .default(Text("OK")))
                case .second:
                    return Alert(title: Text("Pouch size is incorrect"), message: Text("Please enter an double"), dismissButton: .default(Text("OK")))
                case .third:
                    return Alert(title: Text("Date production is incorrect"), message: Text("Please enter an date"), dismissButton: .default(Text("OK")))
               
                case .zero:
                    return Alert(title: Text("Quantity is empty"), message: Text("Please enter quantity"), dismissButton: .cancel())
                }
            }
        }
    }
    
    func saveButton() {
    
        //Validation for textfields
        if self.quantity == "" {
            self.activeAlert = .first
            self.showAlert = true
        }
        else if Double(self.pouchSize) == nil || self.pouchSize == "" {
            self.activeAlert = .second
            self.showAlert = true
        }
//        else if self.dateProd == nil || self.dateProd == ""  {
//            self.activeAlert = .third
//            self.showAlert = true
//        }
        
        else {
            let asi = Asi(context: dataController.container.viewContext)
            
            asi.id = UUID()
            asi.quantity = Int16(Int(self.quantity) ?? 0)
            asi.pouchSize = Double(Int16(self.pouchSize) ?? 0)
            asi.dateProd = Date()
            asi.user = self.user
            
            dataController.save()
            
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddNewAsiView_Previews: PreviewProvider {
    
    static let dataController = CoreDataManager.preview
    
    static var previews: some View {
        let user = User(context: dataController.container.viewContext)
        return AddNewAsiView(user: user).environment(\.managedObjectContext, dataController.container.viewContext).environmentObject(dataController)
    }
}
