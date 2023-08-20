//
//  AsiDetailView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 20/08/23.
//

import SwiftUI

struct AsiDetailView: View {
    
    let asi : Asi
    
    var user : User? {
        asi.user
    }
    
    var body: some View {
        Form {
            Section (header: Text("User")) {
                List {
                    Text("\(user?.name ?? "")")
                }
            }
            Section (header: Text("Quantity")) {
                List {
                    Text("\(String(asi.quantity))")
                }
            }
            Section (header: Text("Pouch Size")) {
                List {
                    Text("\(String(asi.pouchSize))")
                }
            }
        }
        .navigationTitle("Asi")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AsiDetailView_Previews: PreviewProvider {
    
    static var dataController = CoreDataManager.preview
    
    static var previews: some View {
        let asi = Asi(context: dataController.container.viewContext)
        asi.pouchSize = 120.0
        
        return AsiDetailView(asi: asi)
    }
}
