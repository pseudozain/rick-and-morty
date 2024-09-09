//
//  AppRouter.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
import Networking

private var baseUrl: URL = {
    if let urlString = Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as? String,
       let url = URL(string: urlString) {
        return url
    } else {
        fatalError("URL not found.")
    }
}()

enum AppRouter<T: Encodable>: NetworkingURLRequestConvertible, Convertible {
    case getCharacters(RouterInput<T>)

    private var method: NetworkingHTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }

    private var path: String {
        switch self {
        case .getCharacters:
            return "character"
        }
    }

    private var input: RouterInput<T>? {
        switch self {
        case .getCharacters(let input):
            return input
        }
    }

    func asURLRequest() throws -> URLRequest {
        return try urlRequest(with: baseUrl, path: path, method: method, input: input)
    }
}

