//
//  CharacterListBuilderTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import RickAndMorty

class CharacterListBuilderTests: XCTestCase {
    // MARK: - Tests
    func testBuild_returnsCharacterListViewController() {
        let viewController = CharacterListBuilder.build(actionCallback: nil)
        
        XCTAssertTrue(viewController is CharacterListViewController)
    }
}

