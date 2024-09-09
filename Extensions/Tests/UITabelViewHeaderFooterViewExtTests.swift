//
//  UITabelViewHeaderFooterViewExtTests.swift
//  
//
//  Created by Zain ul Abe Din on 09/09/2024.
//

import XCTest
import UIKit
@testable import Extensions

final class UITabelViewHeaderFooterViewExtTests: XCTestCase {
    // MARK: - Mock cell
    private final class MockHaderFooterView: UITableViewHeaderFooterView {}
    
    // MARK: - Tests
    func testReuseIdentifier_shouldReturcNameOfClass() {
        XCTAssertEqual(MockHaderFooterView.reuseId, "MockHaderFooterView")
    }
}
