//
//  StepDivider.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct StepDivider: View {
    let isActive: Bool
    var isSignIn: Bool = false
    
    func getHeight() -> CGFloat {
        if isSignIn {
            return 2.0
        }
        else {
            return 6.0
        }
    }

    var body: some View {
        Capsule()
            .fill(isSignIn ? Colors.ab500 : (isActive ? Colors.ab400 : Colors.white))
            .frame(height: getHeight())
            .fixedSize(horizontal: false, vertical: true)
    }
}

struct StepDivider_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            StepDivider(isActive: true)
            StepDivider(isActive: false)
        }
        .frame(width: 200)
        .previewLayout(.sizeThatFits)
    }
}
