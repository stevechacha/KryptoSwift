//
//  ConvertionView.swift
//  Krypto
//
//  Created by stephen chacha on 07/10/2024.
//

import SwiftUI

struct ConvertionView : View {
    @StateObject var viewModel = ConvertionViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    TextField("Enter Amount",text: $viewModel.amount)
                        .modifier(KryptoTextFieldModifiers())
                }.padding()
            }
            .navigationTitle("Convertion")
        
        }

    }
}
