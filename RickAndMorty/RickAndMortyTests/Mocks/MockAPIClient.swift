//
//  MockAPIClient.swift
//  RickAndMorty
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
import Networking
@testable import RickAndMorty

class MockAPIClient: APIClientType {
    var completionForRequest: (code: Int, data: Data) = (-1, Data())

    func request(
        route: NetworkingURLRequestConvertible,
        completion: @escaping RequestCompletionHandler
    ) {
        completion(completionForRequest.code, completionForRequest.data)
    }
}
