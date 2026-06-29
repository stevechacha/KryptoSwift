import Foundation

enum ViewModelErrorMapper {
    static func message(from error: Error) -> String {
        if let kryptoError = error as? KryptoError {
            return kryptoError.localizedDescription
        }
        return error.localizedDescription
    }
}
