//
//  ImagePicker.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI

struct ImagePicker: View {
    let imageState: ImagePickerManager.ImageState

    var body: some View {
        switch imageState {
        case .success(let image):
            Image(uiImage: image)
                .resizable()
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "person.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
    }
}
