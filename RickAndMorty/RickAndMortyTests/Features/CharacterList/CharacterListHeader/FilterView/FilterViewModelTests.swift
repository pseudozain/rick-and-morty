//
//  FilterViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
import Combine
@testable import RickAndMorty

class FilterViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: FilterViewModel!
    var cancellables: Set<AnyCancellable>!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = FilterViewModel()
        cancellables = []
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        cancellables = nil
        super.tearDown()
    }

    // MARK: - Tests
    func testInitialValues() {
        XCTAssertFalse(sut.isAliveEnabled)
        XCTAssertFalse(sut.isDeadEnabled)
        XCTAssertFalse(sut.isUnknownEnabled)
        XCTAssertNil(sut.statusChangeCallback)
    }
    
    func testSelectedFilter_whenAlive_statusChangeCallbackShouldBeInvokedWithStatus() {
        // given
        let expectation = XCTestExpectation(description: "Callback is triggered")
        var callbackStatus: CharacterStatus?

        sut.statusChangeCallback = { status in
            callbackStatus = status
            expectation.fulfill()
        }
        
        // when
        sut.selectedFilter(with: .alive)
        
        // then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(sut.isAliveEnabled)
        XCTAssertFalse(sut.isDeadEnabled)
        XCTAssertFalse(sut.isUnknownEnabled)
        XCTAssertEqual(callbackStatus, .alive)
    }
    
    func testSelectedFilter_whenDead_statusChangeCallbackShouldBeInvokedWithStatus() {
        // given
        let expectation = XCTestExpectation(description: "Callback is triggered")
        var callbackStatus: CharacterStatus?

        sut.statusChangeCallback = { status in
            callbackStatus = status
            expectation.fulfill()
        }
        
        // when
        sut.selectedFilter(with: .dead)
        
        // then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertFalse(sut.isAliveEnabled)
        XCTAssertTrue(sut.isDeadEnabled)
        XCTAssertFalse(sut.isUnknownEnabled)
        XCTAssertEqual(callbackStatus, .dead)
    }

    func testSelectedFilter_whenUnknown_statusChangeCallbackShouldBeInvokedWithStatus() {
        // given
        let expectation = XCTestExpectation(description: "Callback is triggered")
        var callbackStatus: CharacterStatus?

        sut.statusChangeCallback = { status in
            callbackStatus = status
            expectation.fulfill()
        }
        
        // when
        sut.selectedFilter(with: .unknown)
        
        // then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertFalse(sut.isAliveEnabled)
        XCTAssertFalse(sut.isDeadEnabled)
        XCTAssertTrue(sut.isUnknownEnabled)
        XCTAssertEqual(callbackStatus, .unknown)
    }

    func testSelectedFilter_whenSameStatusIsToggled_statusChangeCallbackShouldBeInvokedWithNil() {
        // given
        sut.selectedFilter(with: .alive)
        
        let expectation = XCTestExpectation(description: "Callback is triggered for deselection")
        var callbackStatus: CharacterStatus?

        sut.statusChangeCallback = { status in
            callbackStatus = status
            expectation.fulfill()
        }
        
        // when
        sut.selectedFilter(with: .alive)
        
        // then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertFalse(sut.isAliveEnabled)
        XCTAssertNil(callbackStatus)
    }
}
