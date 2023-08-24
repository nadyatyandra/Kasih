//
//  RoleOptionCard.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct RoleOptionCard: View {
    let role: UserRoleEnum
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Colors.white)
                .shadow(color: Colors.black.opacity(0.15), radius: 5, x: 0, y: 2)

            Text(role.rawValue)
                .typography(.heading2)
                .padding(.vertical, 36)
                .padding(.horizontal)
        }
        .fixedSize(horizontal: false, vertical: true)
        .onTapGesture(perform: action)
    }
}

struct RoleOptionCard_Previews: PreviewProvider {
    static var previews: some View {
        RoleOptionCard(role: .donator, isSelected: true) {}
    }
}
