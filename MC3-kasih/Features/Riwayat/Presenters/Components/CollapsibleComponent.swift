//
//  CollapsibleComponent.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 23/08/23.
//

import SwiftUI

struct Collapsible: View {
    var label: AnyView
    var content: AnyView
    
    @State private var collapsed: Bool = true
    
    var body: some View {
        VStack {
            Button(
                action: { self.collapsed.toggle() },
                label: {
                    HStack {
                        self.label
                            .overlay(alignment: .topTrailing) {
                                Image(systemName: self.collapsed ? "chevron.down" : "chevron.up")
                                    .foregroundColor(Colors.ab500)
                                    .font(.system(size: 16.0))
                            }
                            .padding(4)
                    }
                    .padding(.bottom, 1)
                    .background(Color.white.opacity(0.01))
                }
            )
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                self.content
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? 0 : .none)
            .clipped()
            .animation(.easeOut, value: collapsed)
            .transition(.slide)
        }
    }
}
