//
//  ScreeningImagePicker.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 22/08/23.
//

import SwiftUI
import PhotosUI

struct ScreeningImage: View {
    let imageState: ImagePickerManager.ImageState
    
    var body: some View {
        ImagePicker(imageState: imageState)
            .scaledToFill()
            .frame(minWidth: 360)
            .frame(height: 230)
            .fixedSize(horizontal: false, vertical: true)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .background {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
                    .foregroundColor(Colors.ab500)
            }
        
    }
}

struct EditableScreeningImage: View {
    @ObservedObject var imagePicker: ImagePickerManager
    
    var body: some View {
        ScreeningImage(imageState: imagePicker.imageState)
            .overlay(alignment: imagePicker.imageState == .empty ? .center : .topTrailing) {
                PhotosPicker(selection: $imagePicker.imageSelection,
                             matching: .images,
                             photoLibrary: .shared())
                {
                    switch imagePicker.imageState {
                    case .empty:
                        Text("Tambah Foto")
                            .typography(.large)
                    case .success(_):
                        Circle()
                            .foregroundColor(Colors.white)
                            .frame(width: 36)
                            .overlay {
                                Image(systemName: "pencil")
                                    .foregroundColor(Colors.black)
                                    .typography(.smallBold)
                            }
                    case .failure:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.yellow)
                    default:
                        EmptyView()
                    }
                }
                .buttonStyle(.borderless)
                .padding(8)
            }
    }
}

struct ScreeningImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        EditableScreeningImage(imagePicker: ImagePickerManager())
            .previewLayout(.sizeThatFits)
    }
}
