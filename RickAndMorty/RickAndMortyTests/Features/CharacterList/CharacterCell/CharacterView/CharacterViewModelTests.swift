//
//  CharacterViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import RickAndMorty

class CharacterViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: CharacterViewModel!
    var mockCharacter: Character!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        mockCharacter = .stub()
        sut = CharacterViewModel(character: mockCharacter)
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        mockCharacter = nil
        super.tearDown()
    }
    
    func testNameIsCorrectlySet() {
        XCTAssertEqual(sut.name, mockCharacter.name)
    }
    
    func testSpeciesIsCorrectlySet() {
        XCTAssertEqual(sut.species, mockCharacter.species)
    }
    
    func testImageUrlIsCorrectlySet() {
        XCTAssertEqual(sut.imageUrl, mockCharacter.image)
    }
}
