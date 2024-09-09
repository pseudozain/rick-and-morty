//
//  ServiceTests.swift
//  
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import Networking

class ServiceTests: XCTestCase {
    // MARK: - Propreties
    var sut: Service!
    var apiClient: MockAPIClient!
    var requestConvertible: MockRequestConvertible!
    
    // MARK: - Test service
    struct TestService: Service {}
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        apiClient = MockAPIClient()
        requestConvertible = MockRequestConvertible()
        sut = TestService()
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        apiClient = nil
        requestConvertible = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testRequest_withSuccessResponse() {
        // given
        let mockData = MockServiceData(someKey: 123, anotherKey: "Testing")
        let data = (try? JSONEncoder().encode(mockData))!
        var apiResponse: MockServiceData?
        apiClient.completionForRequest = (code: 200, data: data)
        
        let responseExpectation = expectation(description: "API responded back")
        
        let success: Success<MockServiceData> = { response in
            apiResponse = response
            responseExpectation.fulfill()
        }
        
        // when
        sut.request(apiClient, route: requestConvertible, onSuccess: success, onFailure: { _ in })
        
        // then
        wait(for: [responseExpectation], timeout: 1.0)
        XCTAssertEqual(apiResponse?.someKey, mockData.someKey)
        XCTAssertEqual(apiResponse?.anotherKey, mockData.anotherKey)
    }
    
    func testRequest_withFailureResponse() {
        // given
        apiClient.completionForRequest = (code: 400, data: Data())
        let responseExpectation = expectation(description: "API responded back")
        let success: Success<MockServiceData> = { _ in }
        let failure: Failure = { _ in
            responseExpectation.fulfill()
        }
        
        // when
        sut.request(apiClient, route: requestConvertible, onSuccess: success, onFailure: failure)
        
        // then
        wait(for: [responseExpectation], timeout: 1.0)
    }
}

private extension ServiceTests {
    struct MockServiceData: Codable {
        let someKey: Int
        let anotherKey: String
    }
}
