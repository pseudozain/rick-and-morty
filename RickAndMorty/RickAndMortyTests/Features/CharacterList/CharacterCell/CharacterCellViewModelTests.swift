//
//  CharacterCellViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import RickAndMorty

final class CharacterCellViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: CharacterCellViewModel!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = CharacterCellViewModel(character: .stub())
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testReuseIdentifier() {
        XCTAssertEqual(sut.reuseIdentifier, "CharacterCell")
    }
}
