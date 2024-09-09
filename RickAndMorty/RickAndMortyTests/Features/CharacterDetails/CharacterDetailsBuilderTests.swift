//
//  CharacterDetailsBuilderTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
import SwiftUI
@testable import RickAndMorty

class CharacterDetailsBuilderTests: XCTestCase {
    // MARK: - Tests
    func testBuild_returnsUIHostingController() {
        let viewController = CharacterDetailsBuilder.build(character: .stub(), actionCallback: nil)
        
        XCTAssertTrue(viewController is UIHostingController<CharacterDetailsView<CharacterDetailsViewModel>>)
    }
}
