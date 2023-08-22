//
//  BackButton.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct BackButton: View {
    let onTap : () -> ()

    var body: some View {
        Button(action: onTap) {
            Image(systemName: "chevron.backward")
                .typography(.large)
            Text("Kembali")
                .typography(.base)
                .padding(.leading, 8)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(){
            print("Back button pressed")
        }
    }
}
