//
//  AppServiceTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
import Networking
@testable import RickAndMorty

final class AppServiceTests: XCTestCase {
    var sut: AppService!
    var apiClient: MockAPIClient!

    override func setUp() {
        super.setUp()
        apiClient = MockAPIClient()
        sut = AppService(apiClient: apiClient)
    }

    override func tearDown() {
        apiClient = nil
        sut = nil
        super.tearDown()
    }

    func testGetCharacters() {
        // given
        let result: PaginatedResponse = .stub()
        let data = (try? JSONEncoder().encode(result))!
        
        apiClient.completionForRequest = (200, data)
        let responseExpectation = expectation(description: "API responded back")
        var response: PaginatedResponse?
        let success: Success<PaginatedResponse> = { result in
            response = result
            responseExpectation.fulfill()
        }
        let failure: Failure = { _ in
            responseExpectation.fulfill()
        }

        // when
        sut.getCharacters(for: 1, status: .alive, onSuccess: success, onFailure: failure)

        // then
        wait(for: [responseExpectation], timeout: 1.0)
        XCTAssertEqual(result, response)
    }

}
