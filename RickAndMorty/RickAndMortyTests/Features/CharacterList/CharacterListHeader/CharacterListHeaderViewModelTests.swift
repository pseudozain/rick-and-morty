//
//  CharacterListHeaderViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import RickAndMorty

class CharacterListHeaderViewModelTests: XCTestCase {
    // MARK: - Properties
    var sut: CharacterListHeaderViewModel!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = CharacterListHeaderViewModel()
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testReuseIdentifier() {
        XCTAssertEqual(sut.reuseIdentifier, "CharacterListHeaderView")
    }
}
