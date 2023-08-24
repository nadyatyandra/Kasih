//
//  SkriningKesehatanView.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import SwiftUI

struct SkriningKesehatanView: View {
    @ObservedObject var viewModel: SignUpViewModel
    let files: [String] = ["HIVTest", "HepatitisBtest", "Syphillistest", "IgMCMV"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Colors.ab500, lineWidth: 1)
            VStack {
                Text("Dokumen Opsional")
                    .typography(.heading2)
                Text("HIV, Hepatitis B, Sifilis, dan IgM CMV")
                    .typography(.baseBold)
                Text("dalam format JPEG, ZIP, atau PDF")
                    .typography(.base)
                Button("Unggah Dokumen") {
                    viewModel.isScreened.toggle()
                }
                .buttonStyle(.appSecondary)
                .padding(.vertical)
                if viewModel.isScreened {
                    ForEach(files, id: \.self) { file in
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .stroke(Colors.ab500, lineWidth: 1)
                            HStack {
                                Text("\(file).jpeg")
                                    .typography(.large)
                                Spacer()
                                Text("987 kb")
                                    .typography(.large)
                                Image(systemName: "trash.fill")
                                    .foregroundColor(Colors.pp400)
                            }
                            .padding(12)
                        }
                    }
                }
            }
            .padding()
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct SkriningKesehatanView_Previews: PreviewProvider {
    static var previews: some View {
        SkriningKesehatanView(viewModel: SignUpViewModel(userRepo: UserRepository()))
    }
}
