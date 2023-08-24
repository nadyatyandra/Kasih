//
//  TambahASIViewModel.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import Foundation
import Combine
import PhotosUI

class TambahASIViewModel: ObservableObject {
    @Published var jumlahKantong: Int = 0
    @Published var ukuranKantong: Int = 0
    @Published var bulanProduksi: Date?
    
    @Published var asi: UIImage?
    
    var isValidStep: Bool {
        asi != nil && jumlahKantong != 0 && ukuranKantong != 0 && bulanProduksi != nil
    }
    
    func jumlahKantongString() -> String {
        if jumlahKantong != 0 {
            return "\(jumlahKantong) Kantong"
        } else {
            return ""
        }
    }
    
    func ukuranKantongString() -> String {
        if ukuranKantong != 0 {
            return "\(ukuranKantong) mL"
        } else {
            return ""
        }
    }
    
    private func resetImagePickers() {
        asi = nil
    }
}
