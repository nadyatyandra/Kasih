//
//  RoleInfoSheet.swift
//  MC3-kasih
//
//  Created by Fernando Putra on 23/08/23.
//

import SwiftUI

struct RoleInfoSheet: View {
    @Environment(\.dismiss) private var dismiss
    var role: UserRoleEnum
    let onNext: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text("Sebagai \(role.rawValue):")
                .typography(.large)
            VStack(alignment: .leading, spacing: 8) {
                Text("1. Anda perlu menyiapkan KTP untuk verifikasi data diri")
                Text(role == .recipient
                     ? "2. Anda dapat memilih donatur ASI sesuai dengan kebutuhan Anda (preferensi agama, preferensi gaya hidup, dan lainnya)"
                     : "2. Anda dapat menyediakan dokumen medis (HIV, Hepatitis B, Sifilis, dan IgM CMV) untuk verifikasi riwayat kesehatan")
                Text(role == .recipient
                     ? "3. Anda dapat melihat donatur yang sudah maupun belum terverifikasi skrining kesehatan yang meliputi HIV, Hepatitis, Sifilis, dan IgM CMV"
                     : "3. Dokumen medis tersebut terjamin kerahasiannya sesuai Syarat & Ketentuan")
            }
            .multilineTextAlignment(.leading)
            .typography(.base)
            .padding(.top, 12)
            Button("Lanjut") {
                onNext()
                dismiss()
            }
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(.appPrimary)
            .padding(.top, 24)
            Button("Batal") {
                dismiss()
            }
            .fixedSize(horizontal: false, vertical: true)
            .buttonStyle(.appSecondary)
            .padding(.top, 8)
        }
    }
}

struct RoleInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        RoleInfoSheet(role: .recipient) {}
    }
}
