//
//  LoadingView.swift
//  Krypto
//
//  Created by stephen chacha on 16/10/2024.
//


import SwiftUI

struct LoadingView: View {
    var body: some View {
        Spacer()
        ProgressView("Loading Coins...")
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
        Spacer()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
