//
//  PriceConversionView.swift
//  Krypto
//
//  Created by stephen chacha on 21/12/2024.
//

import SwiftUI

struct PriceConversionView: View {
    @StateObject private var viewModel = PriceConversionViewModel()

    @State private var amount: String = ""
    @State private var baseCurrency: String = "btc-bitcoin"
    @State private var quoteCurrency: String = "eth-ethereum"

    let currencies = [
        "btc-bitcoin": "Bitcoin",
        "eth-ethereum": "Ethereum",
        "usd-us-dollars": "US Dollars",
        "sol-solana": "Solana"
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Title in NavigationStack
                VStack(alignment: .leading, spacing: 8) {
                    Text("Amount:")
                        .font(.headline)
                    TextField("Enter amount", text: $amount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                }
                .padding(.horizontal, 20)

                // Base Currency Picker
                VStack(alignment: .leading) {
                    Text("From")
                        .font(.headline)
                    Picker("Base Currency", selection: $baseCurrency) {
                        ForEach(currencies.keys.sorted(), id: \.self) { key in
                            Text(currencies[key] ?? key).tag(key)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 20)

                // Quote Currency Picker
                VStack(alignment: .leading) {
                    Text("To")
                        .font(.headline)
                    Picker("Quote Currency", selection: $quoteCurrency) {
                        ForEach(currencies.keys.sorted(), id: \.self) { key in
                            Text(currencies[key] ?? key).tag(key)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal, 20)

                // Convert Button
                Button(action: {
                    Task {
                        guard let enteredAmount = Double(amount) else {
                            viewModel.errorMessage = "Invalid amount entered."
                            return
                        }
                        await viewModel.fetchPriceConversion(
                            baseCurrencyID: baseCurrency,
                            quoteCurrencyID: quoteCurrency,
                            amount: enteredAmount
                        )
                    }
                }) {
                    Text("CONVERT")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)

                // Loading, Error, and Result Display
                if viewModel.isLoading {
                    ProgressView("Converting...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                } else if let priceConversion = viewModel.priceConversion {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Conversion Result:")
                            .font(.headline)
                        Text("Base Currency: \(priceConversion.baseCurrencyName)")
                        Text("Quote Currency: \(priceConversion.quoteCurrencyName)")
                        Text("Amount: \(priceConversion.amount, specifier: "%.2f")")
                        Text("Converted Price: \(priceConversion.price, specifier: "%.4f")")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                } else {
                    Text("Enter details to convert.")
                        .foregroundColor(.gray)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Quick Conversion") // Title set via NavigationStack
        }
    }
}






