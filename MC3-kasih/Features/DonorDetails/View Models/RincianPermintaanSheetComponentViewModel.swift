//
//  RincianPermintaanSheetComponentViewModel.swift
//  MC3-kasih
//
//  Created by Nadya Tyandra on 24/08/23.
//

import Foundation


class RincianPermintaanSheetComponentViewModel: ObservableObject {
    @Published var jumlahProduk: Int = 0
    @Published var tanggalPengambilan: Date = Date()
    @Published var waktuPengambilan: Date = Date()
    
    var isValidStep: Bool {
        jumlahProduk != 0
    }
    
    func jumlahProdukString() -> String {
        if jumlahProduk != 0 {
            return "\(jumlahProduk) Kantong"
        } else {
            return ""
        }
    }
    
    func formatTime(from date: Date) -> String? {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            return dateFormatter.string(from: date)
    }
}
