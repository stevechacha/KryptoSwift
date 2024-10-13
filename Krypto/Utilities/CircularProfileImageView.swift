//
//  CircularProfileImageView.swift
//  Krypto
//
//  Created by stephen chacha on 08/10/2024.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("search.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 40,height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
