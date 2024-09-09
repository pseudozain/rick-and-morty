//
//  UITableViewCellExtTests.swift
//  
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import XCTest
import UIKit
@testable import Extensions

final class UITableViewCellExtTests: XCTestCase {
    // MARK: - Mock cell
    private final class MockTableViewCell: UITableViewCell {}
    
    // MARK: - Tests
    func testReuseIdentifier_shouldReturcNameOfClass() {
        XCTAssertEqual(MockTableViewCell.reuseId, "MockTableViewCell")
    }
}
