//
//  MockRequestConvertible.swift
//  
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import Foundation
@testable import Networking

final class MockRequestConvertible: NetworkingURLRequestConvertible {
    // MARK: - Properties
    var urlRequest = URLRequest(url: URL(string: "www.example.com")!)
    var isAsUrlRequestCalled = false
    
    // MARK: - Functions
    func asURLRequest() throws -> URLRequest {
        isAsUrlRequestCalled = true
        return urlRequest
    }
}
