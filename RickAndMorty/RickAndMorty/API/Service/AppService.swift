//
//  AppService.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
import Networking

protocol AppServiceType {
    func getCharacters(
        for page: Int,
        status: CharacterStatus?,
        onSuccess: @escaping Success<PaginatedResponse>,
        onFailure: @escaping Failure
    )
}

class AppService: Service {
    // MARK: - Propreties
    private let apiClient: APIClientType

    // MARK: - Initializer
    init(apiClient: APIClientType = APIClient()) {
        self.apiClient = apiClient
    }
}

// MARK: - Implementation
extension AppService: AppServiceType {
    func getCharacters(
        for page: Int,
        status: CharacterStatus?,
        onSuccess: @escaping Success<PaginatedResponse>,
        onFailure: @escaping Failure
    ) {
        var query = ["page": "\(page)"]
        if let status = status {
            query["status"] = status.rawValue.lowercased()
        }
        let input: RouterInput<[String: Int]> = (body: nil, query: query, pathVariables: nil)
        let route = AppRouter.getCharacters(input)
        request(apiClient, route: route, onSuccess: onSuccess, onFailure: onFailure)
    }
}
