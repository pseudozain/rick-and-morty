//
//  CharacterDetailsViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import RickAndMorty

class CharacterDetailsViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: CharacterDetailsViewModel!
    let mockCharacter: Character = .stub()
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = CharacterDetailsViewModel(with: mockCharacter, actionCallback: nil)
    }

    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Tests
    func testViewModelInitialization() {
        XCTAssertEqual(sut.name, mockCharacter.name)
        XCTAssertEqual(sut.species, mockCharacter.species)
        XCTAssertEqual(sut.gender, mockCharacter.gender)
        XCTAssertEqual(sut.status, mockCharacter.status.rawValue.capitalized)
        XCTAssertEqual(sut.location, mockCharacter.location.name)
        XCTAssertEqual(sut.imageUrl, mockCharacter.image)
    }
    
    func testOnTapBack_shouldCallActionCallback() {
        // given
        var actionTriggered: CharacterDetailsAction?
        let expectation = expectation(description: "Action callback should be called")

        let viewModel = CharacterDetailsViewModel(with: mockCharacter) { action in
            actionTriggered = action
            expectation.fulfill()
        }

        // when
        viewModel.onTapBack()
        
        // then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(actionTriggered, .back)
    }
}
