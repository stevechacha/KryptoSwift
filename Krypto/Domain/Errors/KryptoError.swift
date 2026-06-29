import Foundation

enum KryptoError: LocalizedError {
    case invalidURL
    case invalidResponse(statusCode: Int)
    case decodingFailed
    case requestFailed(description: String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .invalidResponse(let statusCode):
            return "Received invalid response from server with status code \(statusCode)."
        case .decodingFailed:
            return "Failed to decode the response."
        case .requestFailed(let description):
            return "Unable to complete the request: \(description)"
        }
    }
}
