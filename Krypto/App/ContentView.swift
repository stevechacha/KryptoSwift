//
//  ContentView.swift
//  Krypto
//
//  Created by stephen chacha on 06/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CoinListViewModel()
    
    var body: some View {
        Group {
            CoinTabView()
        }
    }
}


#Preview {
    ContentView()
}
