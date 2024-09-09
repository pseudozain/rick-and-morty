//
//  UIViewExtTests.swift
//  
//
//  Created by Zain ul Abe Din on 08/09/2024.
//

import XCTest
import SwiftUI
import UIKit

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
    
    func testHost_whenNoSubviewExists_thenShouldAddSwiftUIViewAsSubview() {
        // given
        let viewToHost = Text("Hello, World!")
        var containerView = UIView()
        
        // when
        containerView.host(viewToHost)
        
        // then
        XCTAssertEqual(containerView.subviews.count, 1)
    }
    
    func testHost_whenSubviewExists_thenRemovesPreviousSubviews() {
        // given
        var containerView = UIView()
        let previousSubview = UIView()
        containerView.addSubview(previousSubview)
        let viewToHost = Text("Hello, World!")
        
        // when
        containerView.host(viewToHost)
        
        // then
        XCTAssertFalse(containerView.subviews.contains(previousSubview))
    }
}
