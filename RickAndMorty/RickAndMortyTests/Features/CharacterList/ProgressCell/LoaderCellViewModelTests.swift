//
//  LoaderCellViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
@testable import RickAndMorty

final class LoaderCellViewModelTests: XCTestCase {
    // MARK: - Properties
    private var sut: LoaderCellViewModel!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = LoaderCellViewModel()
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testReuseIdentifier_shouldBeLoaderCell() {
        XCTAssertEqual(sut.reuseIdentifier, "LoaderCell")
    }
}
