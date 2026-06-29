import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(
        endpoint: String,
        queryItems: [URLQueryItem]?
    ) async throws -> T
}

final class NetworkClient: NetworkClientProtocol {
    private let baseURL = "https://api.coinpaprika.com/v1"
    private let decoder: JSONDecoder
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .useDefaultKeys
        self.decoder.dateDecodingStrategy = .iso8601
    }

    func request<T: Decodable>(
        endpoint: String,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> T {
        guard var urlComponents = URLComponents(string: "\(baseURL)/\(endpoint)") else {
            throw KryptoError.invalidURL
        }

        if let queryItems {
            urlComponents.queryItems = queryItems
        }

        guard let url = urlComponents.url else {
            throw KryptoError.invalidURL
        }

        let data: Data
        let response: URLResponse

        do {
            (data, response) = try await session.data(from: url)
        } catch {
            throw KryptoError.requestFailed(description: error.localizedDescription)
        }

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw KryptoError.invalidResponse(
                statusCode: (response as? HTTPURLResponse)?.statusCode ?? -1
            )
        }

        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw KryptoError.decodingFailed
        }
    }
}
