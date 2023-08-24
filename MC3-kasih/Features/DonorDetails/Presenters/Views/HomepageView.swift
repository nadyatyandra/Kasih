//
//  HomepageView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 22/08/23.
//

import SwiftUI

struct HomepageView: View {

    var body: some View {
        TabView {
            Group {
                KatalogView()
                    .tabItem {
                        Label("Katalog", systemImage: "rectangle.grid.1x2.fill")
                    }
                RiwayatView()
                    .tabItem {
                        Label("Riwayat", systemImage: "note.text")
                    }
            }
            .toolbarBackground(Colors.pp200, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
