//
//  InstantiableTypeTests.swift
//  RickAndMortyTests
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
import UIKit
@testable import RickAndMorty

class InstantiableTypeTests: XCTestCase {
    func testInstantiateFromStoryboard_whenViewControllerWithIdentfierExists_shouldInstantiateViewController() {
        // when
        let viewController = TestViewController.instantiateFromStoryboard(with: "Test", in: Bundle(for: TestViewController.self))
        
        // then
        XCTAssertNotNil(viewController)
    }
}
