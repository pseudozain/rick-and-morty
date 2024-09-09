//
//  UIViewExtTests.swift
//  
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import XCTest

final class UIViewExtTests: XCTestCase {
    // MARK: - Properties
    private var sut: UIView!
    private var viewController: UIViewController!
    
    // MARK: - Setup
    override func setUp() {
        super.setUp()
        sut = UIView(frame: CGRect(x: .zero, y: .zero, width: 200, height: 200))
        viewController = UIViewController()
        viewController.view.addSubview(sut)
        _ = viewController.view
    }
    
    // MARK: - Tear down
    override func tearDown() {
        sut = nil
        viewController = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    func testEmbedView_whenInsestsAreProvided_shouldAddSubViewWithInsets() {
        // given
        let view = UIView()
        
        // when
        sut.embedView(view, insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        sut.layoutSubviews()
        
        // then
        XCTAssertEqual(view.frame, CGRect(x: 10, y: 10, width: 180, height: 180))
    }
    
    func testEmbedView_whenInsestsAreNotProvided_shouldAddSubViewWithoutInsets() {
        // given
        let view = UIView()
        
        // when
        sut.embedView(view, insets: .zero)
        sut.layoutSubviews()
        
        // then
        XCTAssertEqual(view.frame, sut.bounds)
    }
    
}
