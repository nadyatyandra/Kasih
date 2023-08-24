//
//  Chip.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct ChipComponent: View {
    let value: String
    @State var isSelected: Bool
    var isDisabled: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(Colors.ab500, lineWidth: 1.5)
            if !isDisabled {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(isSelected ? Colors.ab500 : Colors.white)
            }
            Text(value)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .foregroundColor(isSelected ? Colors.white : Colors.ab500)
                .lineLimit(1)
                .typography(.base)
        }
        .fixedSize()
        .onTapGesture {
            if !isDisabled {
                isSelected.toggle()
            }
        }
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        ChipComponent(value: "Halo", isSelected: true)
    }
}
