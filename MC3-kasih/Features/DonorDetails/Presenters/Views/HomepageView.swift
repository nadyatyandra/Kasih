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
            ScrollView {
                KatalogView()
            }
            .tabItem {
                Label("Katalog", systemImage: "tray.and.arrow.down.fill")
            }
            
            ScrollView {
                RiwayatView()
            }
            .tabItem {
                Label("Riwayat", systemImage: "tray.and.arrow.up.fill")
            }
        }
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}
