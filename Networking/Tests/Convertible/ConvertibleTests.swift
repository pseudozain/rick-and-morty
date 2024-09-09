//
//  ConvertibleTests.swift
//
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import Networking

class ConvertibleTests: XCTestCase {
    // MARK: - Mocks
    struct MockConvertible: Convertible {}
    
    // MARK: - Properties
    var sut: Convertible!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = MockConvertible()
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testUrlRequest_whenInputIsNil_shouldConstructUrl() throws {
        // given
        let url =  URL(string: "https://www.example.com")!
        let path = "test"
        let input: RouterInput<Int>? = nil
        
        // when
        let request = try sut.urlRequest(
            with: url,
            path: path,
            method: .get,
            requestType: .json,
            input: input
        )
        
        // then
        XCTAssertEqual(request.url?.absoluteString, "https://www.example.com/test")
    }
    
    func testUrlRequest_whenInputContainsQuery_shouldConstructUrlWityQuery() throws {
        // given
        let url =  URL(string: "https://www.example.com")!
        let path = "test"
        let input = RouterInput<[String: String]>(body: nil, query: ["key": "value"], pathVariables: nil)
        
        // when
        let request = try sut.urlRequest(
            with: url,
            path: path,
            method: .get,
            requestType: .json,
            input: input
        )
        
        // then
        XCTAssertEqual(request.url?.absoluteString, "https://www.example.com/test?key=value")
    }
    
    func testUrlRequest() throws {
        // given
        let url =  URL(string: "www.example.com/")!
        let path = "unit/testing"
        let method: NetworkingHTTPMethod = .get
        let requestType: NetworkingRequestType = .json
        let query = ["query": "test"]
        let body = ["someKey": "someValue"]
        let input: RouterInput<[String: String]> = (body: body, query: query, pathVariables: ["somepath"])
        
        // when
        let request = try sut.urlRequest(
            with: url,
            path: path,
            method: method,
            requestType: requestType,
            input: input
        )
        
        // then
        XCTAssertEqual(request.method, method)
        XCTAssertEqual(request.url?.absoluteString, "www.example.com/unit/testing/somepath?query=test")
        let decoded = try? JSONDecoder().decode([String: String].self, from: (request.httpBody)!)
        XCTAssertEqual(decoded?["someKey"], "someValue")
    }
}

