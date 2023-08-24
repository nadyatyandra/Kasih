//
//  ContentView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            HomepageView()
//            SelectUserRoleView(path: $path)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
