//
//  APIError.swift
//  RickAndMorty
//
//  Created by Americo Meneses on 21/02/24.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case badResponse(statusCode: Int)
    case url(URLError?)
    case parseError(DecodingError?)
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .badURL, .parseError, .unknown:
            return "Sorry, something went wrong."
        case .badResponse(_):
            return "Sorry, the connection to the server failed."
        case .url(let error):
            return error?.localizedDescription ?? "something went wrong."
        }
    }
    
    var description: String {
        switch self {
        case .badURL:
            return "Invalid URL"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        case .url(let error):
            return error?.localizedDescription ?? "Url session error"
        case .parseError(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .unknown:
            return "unknown error"
        }
    }
}
