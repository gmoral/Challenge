//
//  ApiError.swift
//  Challenge
//
//  Created by Guillermo Moral on 25/02/2023.
//

import Foundation

enum ApiError: Error {
    case clientError
    case serverError
    case unknowError
    case errorInUrl
    case errorDecoding
}

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .clientError:
            return NSLocalizedString("Client error", comment: "")
        case .serverError:
            return NSLocalizedString("Server error", comment: "")
        case .unknowError:
            return NSLocalizedString("Unknow error", comment: "")
        case .errorInUrl:
            return NSLocalizedString("Error in url", comment: "")
        case .errorDecoding:
            return NSLocalizedString("Error decoding", comment: "")
        }
    }
}
