//
//  ContentView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack() {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
