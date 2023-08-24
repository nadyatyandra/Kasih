//
//  DetailDonaturView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct DetailDonaturView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ProfilCardComponent()
                ProfilCardComponent()
            }
        }
    }
}

struct DetailDonaturView_Previews: PreviewProvider {
    static var previews: some View {
        DetailDonaturView()
    }
}
