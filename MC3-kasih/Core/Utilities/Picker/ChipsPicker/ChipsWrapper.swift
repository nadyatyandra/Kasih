//
//  ChipWrapper.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct ChipsWrapper: View {
    var chips: [Chip]

    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return GeometryReader { geo in
            ZStack(alignment: .topLeading, content: {
                ForEach(chips) { data in
                    ChipComponent(value: data.value, isSelected: data.isSelected)
                        .padding(.all, 5)
                        .alignmentGuide(.leading) { dimension in
                            if (abs(width - dimension.width) > geo.size.width) {
                                width = 0
                                height -= dimension.height
                            }
                            let result = width
                            if data.id == chips.last!.id {
                                width = 0
                            } else {
                                width -= dimension.width
                            }
                            return result
                        }
                        .alignmentGuide(.top) { dimension in
                            let result = height
                            if data.id == chips.last!.id {
                                height = 0
                            }
                            return result
                        }
                }
            })
        }
    }
}

struct ChipsWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsWrapper(
            chips:
                [
                    Chip(value: "hahaahah", isSelected: true),
                    Chip(value: "hehehee", isSelected: false),
                    Chip(value: "hihih", isSelected: false),
                    Chip(value: "hohosss", isSelected: true),
                    Chip(value: "huhuuuhu", isSelected: false)
                ]
        )
    }
}
