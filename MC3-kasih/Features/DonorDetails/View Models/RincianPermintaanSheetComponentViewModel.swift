//
//  RincianPermintaanSheetComponentViewModel.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import Foundation


class RincianPermintaanSheetComponentViewModel: ObservableObject {
    @Published var jumlahProduk: Int = 0
    @Published var tanggalPengambilan: Date?
    
    var isValidStep: Bool {
        jumlahProduk != 0 && tanggalPengambilan != nil
    }
    
    func jumlahProdukString() -> String {
        if jumlahProduk != 0 {
            return "\(jumlahProduk) Kantong"
        } else {
            return ""
        }
    }
}
