//
//  ExchangeListViewModel.swift
//  Krypto
//

import Foundation

@MainActor
final class ExchangeListViewModel: ObservableObject {
    @Published var exchanges: [Exchange] = []
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let fetchExchangesUseCase: FetchExchangesUseCaseProtocol

    init(fetchExchangesUseCase: FetchExchangesUseCaseProtocol = DependencyContainer.shared.makeFetchExchangesUseCase()) {
        self.fetchExchangesUseCase = fetchExchangesUseCase
    }

    func fetchExchanges() async {
        isLoading = true
        errorMessage = nil

        do {
            exchanges = try await fetchExchangesUseCase.execute()
        } catch {
            errorMessage = ViewModelErrorMapper.message(from: error)
        }

        isLoading = false
    }
}
