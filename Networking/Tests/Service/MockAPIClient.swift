//
//  MockAPIClient.swift
//  
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
@testable import Networking

final class MockAPIClient: APIClientType {
    var completionForRequest: (code: Int, data: Data) = (-1, Data())
    
    func request(
        route: NetworkingURLRequestConvertible,
        completion: @escaping RequestCompletionHandler
    ) {
        completion(completionForRequest.code, completionForRequest.data)
    }
}
